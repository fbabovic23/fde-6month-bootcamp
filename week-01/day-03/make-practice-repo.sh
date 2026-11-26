#!/usr/bin/env bash
# make-practice-repo.sh  -  W01D03 fixture, written by the Mentor (not today's skill).
#
# Builds a throwaway Git repo for practising interactive rebase, cherry-pick and bisect:
#
#   main                     v0.1 + 16 commits. A regression hides in one of them.
#   feature/csv-export       7 messy commits on top of main, to clean up with rebase -i.
#   release-1.0              branched at v0.1. Needs one bug fix from the feature branch.
#   tag snapshot/feature-before   the feature branch before you touch it.
#
# The position of the regression is random on every run, so you cannot know the answer
# in advance. Treat the repo as a client's black box:
# don't read the render functions below until you have bisected.
#
# Usage: ./make-practice-repo.sh [target-dir]     (default: ~/scratch/w01d03-git-practice)

set -euo pipefail

target="${1:-$HOME/scratch/w01d03-git-practice}"
if [ -e "$target" ]; then
  echo "error: $target already exists. Delete it or pass another path." >&2
  exit 1
fi

mkdir -p "$target"
cd "$target"
git init -q -b main

# Throwaway identity, stored in this repo only. Your global personal/work identity is untouched.
git config user.name "Practice Bot"
git config user.email "practice@example.invalid"
git config commit.gpgsign false
git config tag.gpgsign false

tick=0
commit() {
  tick=$((tick + 1))
  when="2026-11-02T09:$(printf '%02d' "$tick"):00+01:00"
  git add -A
  GIT_AUTHOR_DATE="$when" GIT_COMMITTER_DATE="$when" git commit -q --no-verify -m "$1"
}

# ---------------------------------------------------------------- random positions
broken_at=8                                  # fixed on purpose
bug_at=$(( broken_at + (RANDOM % 7) ))       # random: step 8..14

# ---------------------------------------------------------------- rules.py renderer
op=">="; redirect=0; named_client=0; tidy_doc=0; consts=0; helper=0; broken=0

lit() {  # lit CONSTANT_NAME value  -> constant name once constants exist, else a string literal
  if [ "$consts" = 1 ]; then printf '%s' "$1"; else printf '"%s"' "$2"; fi
}

render_rules() {
  {
    echo '"""Triage rules: map an HTTP status code to a bucket."""'
    echo
    echo 'SERVER_ERROR_MIN = 500'
    if [ "$named_client" = 1 ]; then echo 'CLIENT_ERROR_MIN = 400'; fi
    if [ "$redirect" = 1 ]; then echo 'REDIRECT_MIN = 300'; fi
    if [ "$consts" = 1 ]; then
      echo
      echo 'SERVER_ERROR = "server_error"'
      echo 'CLIENT_ERROR = "client_error"'
      if [ "$redirect" = 1 ]; then echo 'REDIRECT = "redirect"'; fi
      echo 'OK = "ok"'
    fi
    echo
    echo
    echo 'def classify(status):'
    if [ "$tidy_doc" = 1 ]; then
      echo '    """Return the triage bucket for an HTTP status code.'
      echo
      echo '    5xx -> server_error, 4xx -> client_error, 3xx -> redirect, anything else -> ok.'
      echo '    """'
    else
      echo '    """Map an HTTP status code to a triage bucket."""'
    fi
    echo "    if status $op SERVER_ERROR_MIN:"
    echo "        return $(lit SERVER_ERROR server_error)"
    if [ "$named_client" = 1 ]; then
      echo '    if status >= CLIENT_ERROR_MIN:'
    else
      echo '    if status >= 400:'
    fi
    echo "        return $(lit CLIENT_ERROR client_error)"
    if [ "$redirect" = 1 ]; then
      echo '    if status >= REDIRECT_MIN:'
      echo "        return $(lit REDIRECT redirect)"
    fi
    echo "    return $(lit OK ok)"
    if [ "$broken" = 1 ]; then
      echo
      echo
      echo 'def bucket_for(status)'
      echo '    return classify(status)'
    fi
    if [ "$helper" = 1 ]; then
      echo
      echo
      echo 'def bucket_for(status):'
      echo '    """Alias kept for the summary module."""'
      echo '    return classify(status)'
    fi
  } > rules.py
}

write_logparse_original() {
  cat > logparse.py <<'EOF'
"""Parse common-log-format access-log lines."""


def parse_line(line):
    """Return (status, path) for one access-log line."""
    parts = line.split()
    return int(parts[8]), parts[6]
EOF
}

write_logparse_fixed() {
  cat > logparse.py <<'EOF'
"""Parse common-log-format access-log lines."""


def parse_line(line):
    """Return (status, path) for one access-log line, or None for a blank line."""
    if not line.strip():
        return None
    parts = line.split()
    return int(parts[8]), parts[6]
EOF
}

# ---------------------------------------------------------------- main: initial commit (v0.1)
write_logparse_original
render_rules
printf '__pycache__/\n*.pyc\n' > .gitignore
echo '0.1.0' > VERSION
cat > README.md <<'EOF'
# logtriage

Tiny access-log triage tool: parse lines, put each status code into a bucket.
EOF
commit "initial: log parser and triage rules"
git tag v0.1

# ---------------------------------------------------------------- main: 14 ordinary steps
step() {
  case "$1" in
    1)  printf '\n## Usage\n\n    python3 -c "from rules import classify; print(classify(404))"\n' >> README.md
        msg="docs: add usage to README" ;;
    2)  redirect=1
        msg="feat: add redirect bucket for 3xx" ;;
    3)  cat > summary.py <<'EOF'
"""Summarise an access log by triage bucket."""
from collections import Counter

from logparse import parse_line
from rules import classify


def summarise(lines):
    counts = Counter()
    for line in lines:
        status, _path = parse_line(line)
        counts[classify(status)] += 1
    return counts
EOF
        msg="feat: summarise counts per bucket" ;;
    4)  printf '\n## Buckets\n\nserver_error (5xx), client_error (4xx), redirect (3xx), ok.\n' >> README.md
        msg="docs: explain buckets in README" ;;
    5)  named_client=1
        msg="refactor: name the client error threshold" ;;
    6)  cat >> summary.py <<'EOF'


def top_paths(lines, n=5):
    paths = Counter()
    for line in lines:
        _status, path = parse_line(line)
        paths[path] += 1
    return paths.most_common(n)
EOF
        msg="feat: add top_paths helper" ;;
    7)  cat > sample.log <<'EOF'
10.0.0.1 - - [02/Nov/2026:09:00:01 +0100] "GET /health HTTP/1.1" 200 2
10.0.0.2 - - [02/Nov/2026:09:00:02 +0100] "GET /orders/17 HTTP/1.1" 404 19
10.0.0.3 - - [02/Nov/2026:09:00:03 +0100] "POST /orders HTTP/1.1" 500 31
10.0.0.4 - - [02/Nov/2026:09:00:04 +0100] "GET /old-path HTTP/1.1" 301 0
10.0.0.5 - - [02/Nov/2026:09:00:05 +0100] "POST /orders HTTP/1.1" 503 31
EOF
        msg="chore: add sample log" ;;
    8)  tidy_doc=1
        msg="refactor: tidy classify docstring" ;;
    9)  cat >> summary.py <<'EOF'


def unique_paths(lines):
    return len({parse_line(line)[1] for line in lines})
EOF
        msg="feat: count unique paths" ;;
    10) printf '# Changelog\n\n## 0.1.0\n\n- First version.\n' > CHANGELOG.md
        msg="docs: add changelog" ;;
    11) consts=1
        msg="refactor: extract bucket names into constants" ;;
    12) printf '*.log.tmp\n' >> .gitignore
        msg="chore: ignore temporary log files" ;;
    13) cat >> summary.py <<'EOF'


def as_percentages(counts):
    total = sum(counts.values()) or 1
    return {bucket: round(100 * n / total, 1) for bucket, n in counts.items()}
EOF
        msg="feat: add percentage helper" ;;
    14) echo '0.2.0' > VERSION
        printf '\n## 0.2.0\n\n- Redirect bucket, summary helpers.\n' >> CHANGELOG.md
        msg="chore: bump version to 0.2.0" ;;
  esac
}

for i in $(seq 1 14); do
  if [ "$i" = "$broken_at" ]; then
    broken=1; render_rules
    commit "wip: start bucket_for helper"
    broken=0; helper=1; render_rules
    commit "fix: finish bucket_for helper"
  fi
  step "$i"
  if [ "$i" = "$bug_at" ]; then op=">"; fi
  render_rules
  commit "$msg"
done

# ---------------------------------------------------------------- release branch
git branch release-1.0 v0.1

# ---------------------------------------------------------------- feature branch (messy on purpose)
git switch -q -c feature/csv-export

write_export() {  # write_export <header> <quoted 0|1> <with_writer 0|1>
  {
    echo '"""Export parsed log rows as CSV."""'
    echo
    echo
    echo 'def to_csv(rows):'
    echo "    out = [\"$1\"]"
    echo '    for status, path in rows:'
    if [ "$2" = 1 ]; then
      echo "        out.append(f'{status},\"{path}\"')"
    else
      echo '        out.append(f"{status},{path}")'
    fi
    echo '    return "\n".join(out) + "\n"'
    if [ "$3" = 1 ]; then
      echo
      echo
      echo 'def write_csv(rows, filename):'
      echo '    with open(filename, "w") as f:'
      echo '        f.write(to_csv(rows))'
    fi
  } > export.py
}

write_export "stauts,path" 0 0
commit "feat: add csv export"
write_export "stauts,path" 0 1
commit "WIP"
write_export "status,path" 0 1
commit "fix typo in csv header"
printf 'EXPORT_API_KEY=FAKE-not-a-real-key-0000\nEXPORT_BUCKET=s3://example-bucket\n' > .env
commit "add .env for local testing"
write_logparse_fixed
commit "fix: handle blank lines in parse_line"
write_export "status,path" 1 1
commit "more wip"
printf '\n## CSV export\n\n    from export import write_csv\n' >> README.md
commit "update readme"

git tag snapshot/feature-before
git switch -q main

# ---------------------------------------------------------------- summary
echo "Practice repo ready: $target"
echo "  main                 $(git rev-list --count main) commits (v0.1 is the first)"
echo "  feature/csv-export   $(git rev-list --count main..feature/csv-export) commits on top of main"
echo "  release-1.0          at v0.1"
echo "  tag snapshot/feature-before = feature branch before cleanup"
echo
echo "Bug report from the client: since v0.1, HTTP 500 responses are counted as client_error."

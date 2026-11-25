# W01D01 notes: http_errors.sh

## Data flow
The script first checks that it got exactly one argument and that the file
exists and is readable. If everything is fine, awk processes the file line
by line. For each line it checks whether the 9th column (the HTTP status
code) is a 3-digit number. If not, it increases the counter for malformed
lines, and `next` makes it jump to the next line of the file, skipping the
rest of the awk rules. If the line is good, it increases `total` and then
checks whether the status is 4xx or 5xx and increases those counters.
The summary line is printed once, in the END block, after the last line.

## Failure behaviour
- Missing file (or no argument): nothing on stdout, the error message goes
  to stderr, and the exit code is 2, which means something went wrong.
- Empty file: the file can still be read, so the script prints the summary
  line with 0 everywhere (malformed=0 too, because there are no lines)
  and exits with 0.
- Broken line: it fails the 3-digit check on column 9, is counted as
  malformed, and `next` moves to the next line of the file, not the next
  line of the script. It is not counted in `total`.
- `if (total > 0)`: if there are valid lines, total is bigger than zero and
  we can calculate the rate. We need the check because we divide by total,
  and we can't divide by zero.

## Trade-off
- What I gave up: the script only works if the 9th column is the status
  code. If the request part has a different number of spaces, the 9th
  column can hold a 3-digit size instead, and the script would use it in
  the calculation and make a mistake.
- What I got: it was much easier to implement, and we didn't need to parse
  the line as much.

## What confused me
- `2>/dev/null` (used when running a command: throw away its stderr) vs
  `>&2` (used inside the script: send this message to stderr).
- `400 <= $9 < 500` doesn't work in awk. It has to be two comparisons
  joined with `&&`.
- `git commit` does nothing until the files are added with `git add`.
  `../` in `git status` meant the whole new folder was untracked.
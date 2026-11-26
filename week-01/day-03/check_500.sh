#!/bin/sh
# check_500.sh - bisect test for the bug report "HTTP 500 is counted as client_error".
# Exit codes for git bisect run: 0 = good, 1 = bad, 125 = can't test this commit (skip).

# Step 1: if rules.py can't even be imported here, this commit can't be tested.
python3 -B -c 'import rules' 2>/dev/null || exit 125

# Step 2: the real test. A passing assert exits 0 (good), a failing one exits 1 (bad).
python3 -B -c 'from rules import classify; assert classify(500) == "server_error"'

#!/bin/sh
# http_errors.sh - summarize HTTP error rates in a combined-format access log.
# Usage:      http_errors.sh LOGFILE
# Exit codes: 0 = summary printed, 2 = wrong usage or unreadable file.

if [ "$#" -ne 1 ]; then
    echo "usage: http_errors.sh LOGFILE" >&2
    exit 2
fi

logfile=$1

if [ ! -f "$logfile" ] || [ ! -r "$logfile" ]; then
    printf 'http_errors.sh: cannot read file: %s\n' "$logfile" >&2
    exit 2
fi

awk '
$9 !~ /^[0-9][0-9][0-9]$/ { malformed++; next }
                          { total++ }
$9 >= 400 && $9 < 500     { c4++ }
$9 >= 500 && $9 < 600     { c5++ }
END {
    rate = 0
    if (total > 0) rate = (c4 + c5) * 100 / total
    printf "total=%d 4xx=%d 5xx=%d error_rate=%.1f%% malformed=%d\n", total, c4, c5, rate, malformed
}
' "$logfile"
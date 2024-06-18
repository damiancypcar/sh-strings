#!/usr/bin/env bash
# Bash implementation of "strings"

set -euo pipefail

strings() {
    if [ -t 0 ]; then
        if [ $# -eq 0 ]; then
            echo; echo "Usage: $0 <file>"
            exit 1
        elif [ ! -f "$1" ]; then
            echo; echo "File $1 does not exist."
            exit 1
        fi
    fi

    # Minimum length of printable strings
    MIN_LENGTH=4

    # Process the file byte by byte
    current_string=""
    while IFS= read -r -n1 char; do
        if [[ "$char" =~ [[:print:]] ]]; then
            current_string+="$char"
        else
            if [ ${#current_string} -ge $MIN_LENGTH ]; then
                echo "$current_string"
            fi
            current_string=""
        fi
    done < "${1:-/dev/stdin}"

    # Print the last string if it's long enough
    if [ ${#current_string} -ge $MIN_LENGTH ]; then
        echo "$current_string"
    fi
}

strings "$@"

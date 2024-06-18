#!/usr/bin/env bash
# Test run with file and pipe on ./strings.sh

set -euo pipefail

file="$1"
    
echo -n "Testing file to test-out1"
./strings.sh "$file" > test-out1 \
&& echo -e "\tDone ✔️ "

echo -n "Testing pipe to test-out2"
cat "$file" | ./strings.sh > test-out2 \
&& echo -e "\tDone ✔️ "

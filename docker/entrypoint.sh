#!/bin/bash

# CHARACTERS=$(echo "$@" | wc -c)
# echo "Character Count: $CHARACTERS"
# TOKENS=$(/usr/bin/python3 /token-count.py "$@")
# echo "Token Count: $TOKENS"
/usr/bin/python3 /script.py -m cpu_and_mobile/cpu-int4-rtn-block-32-acc-level-4 "$@"
#!/bin/bash

# CHARACTERS=$(echo "$@" | wc -c)
# echo "Character Count: $CHARACTERS"
# TOKENS=$(/usr/bin/python3 /token-count.py "$@")
# echo "Token Count: $TOKENS"

# Using docker run -i with out the -t works.
# Now what happens if there is no stdin?

# The problem is that we want to conditionally read from STDIN.

# This command works:
# echo "hello" | docker run -i  ubuntu /bin/bash -c 'cat'

# This command hangs forever
# docker run -i  ubuntu /bin/bash -c 'cat'

# We read the users question as the parameters provided to the script.
# In addition, we want to append any STDIN that is piped to the process
# so that we can use this utility as part of command line processing.
# To do this we need to use a specific utility that works around a 
# limitation of Docker and reading STDIN.

PROMPT="$@"
STDIN=$(/usr/bin/python3 /stdin.py)
if [ ! -z "$STDIN" ]; then
	PROMPT="$PROMPT
$STDIN"
fi

/usr/bin/python3 /script.py -m cpu_and_mobile/cpu-int4-rtn-block-32-acc-level-4 "$PROMPT"
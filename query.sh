#!/bin/bash

# Function to display usage information
usage() {
    echo "Usage: $0 -f FILE PROMPT"
    echo "Options:"
    echo "  -f FILE     Specify a file to read"
    echo "  PROMPT      Input string prompt from the user"
    exit 1
}

# Check if no arguments provided
if [ $# -eq 0 ]; then
    usage
fi

# Parse command line options
while getopts ":f:" opt; do
    case ${opt} in
        f )
            file="$OPTARG"
            ;;
        \? )
            echo "Invalid option: $OPTARG" 1>&2
            usage
            ;;
        : )
            echo "Invalid option: $OPTARG requires an argument" 1>&2
            usage
            ;;
    esac
done
shift $((OPTIND -1))

# Check if prompt is provided
if [ $# -eq 0 ]; then
    echo "Error: No prompt provided" >&2
    usage
fi
prompt="$*"

# Check if file option is provided
if [ -n "$file" ]; then
    if [ ! -f "$file" ]; then
        echo "Error: File '$file' not found" >&2
        exit 1
    fi
    file_content=$(cat "$file")
fi

IMAGE=gencore/phi3-mini-128k
QUERY="Question: $prompt
Source: $file_content"
docker run --rm -ti $IMAGE:latest "$QUERY"
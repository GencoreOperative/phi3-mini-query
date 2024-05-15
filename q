#!/bin/bash

# A script that provides a file and a query about that file to
# the Phi3-Mini LLM. Handles argument parsing logic.

PROJECT="gencore/phi3-mini-query"

docker run --rm -i $PROJECT:latest "$@"
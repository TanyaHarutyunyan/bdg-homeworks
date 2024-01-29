#!/bin/bash

set -e

if [ -z "$1" ]; then
 echo "Error: 1 argument is required!" >&2  # >&2 directs the output to stderr
 exit 1
fi

echo '1'

if [ "$#" -ne 1 ]; then
  echo "Error: Only one argument is required"	
  exit 1
fi

echo $1

if [[ "$1" -eq "amd64" ]]; then
  echo "Error: Only amd64 or arm64 are supported!"
  exit 1
fi

echo '3'

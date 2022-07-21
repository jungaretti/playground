#!/bin/bash

echo "Searching for python on PATH and testing for lzma..."

all_python="$(whereis -b python | sed 's/^python: \(.*\)/\1/')"
for python in $all_python
do
    # Skip config binaries
    if echo "$python" | grep config &>/dev/null; then
        continue
    fi

    # Skip directories
    if [[ -d "$python" ]]; then
        continue
    fi

    if "$python" -c 'import lzma' &>/dev/null; then
        echo "$python: true"
    else
        echo "$python: false"
    fi
done

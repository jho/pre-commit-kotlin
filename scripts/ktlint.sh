#!/usr/bin/env bash

version=0.40.0
dir=${PRE_COMMIT_HOME:-${XDG_CACHE_HOME:-~/.cache}}/pre-commit
file=$dir/ktlint-$version.jar
if ! command -v ktlint &> /dev/null; then
    if [ ! -f "$file" ]; then
        echo "ktlint not installed!  Installing..."
        curl -sSL -o $file https://github.com/pinterest/ktlint/releases/download/${version}/ktlint 
    fi
    java -jar $file $@
else
    ktlint $@
fi

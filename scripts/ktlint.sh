#!/usr/bin/env bash

version=0.48.2
dir=${PRE_COMMIT_HOME:-${XDG_CACHE_HOME:-~/.cache}}/pre-commit
file=$dir/ktlint-$version.jar
if ! command -v ktlint &> /dev/null; then
    if [ ! -f "$file" ]; then
        curl -sSL -o $file https://github.com/pinterest/ktlint/releases/download/${version}/ktlint 
    fi
    java -jar $file $@
else
    ktlint $@
fi

#!/usr/bin/env bash

files=""
args=""
for arg in "$@"; do
	if [[ $arg =~ \.kt(s)?$ ]]; then
		files="$files $arg"
	else
        args="$args $arg"
    fi
done

version=1.22.0-RC2
pre_commit_dir=${PRE_COMMIT_HOME:-${XDG_CACHE_HOME:-~/.cache}}/pre-commit
dir=${pre_commit_dir}/detekt-$version
exec=$dir/bin/detekt-cli
tmp=$(mktemp -d)
zip=$tmp/detekt-cli-${version}.zip
if ! command -v detekt &> /dev/null; then
    if [ ! -f "$exec" ]; then
        curl -sSL -o $zip https://github.com/detekt/detekt/releases/download/v${version}/detekt-cli-${version}.zip
        unzip $zip > /dev/null
        mv detekt-cli-${version} $dir
        rm -rf detekt-cli-${version}
    fi
    $exec $args --input $files 
else
    detekt $args --input $files 
fi

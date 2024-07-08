#!/bin/bash

# cd to the directory where the script is located
cd "$(dirname "$0")" || exit

mkdir -p templates

# This script convert all PDF covers to PNG format.
find ../templates/ -type f -name 'main.pdf' | sed -r 's|/[^/]+$||' | sed -r 's|^../||' | sort | uniq | xargs -I {} convert -density 300 "../{}/main.pdf[0]" -quality 100 "{}.png"

# Special case for `master-thesis` as second page is more interesting.
convert -density 300 "../templates/graduate-thesis/main.pdf[2]" -quality 100 "templates/graduate-thesis.png"

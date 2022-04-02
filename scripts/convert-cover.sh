# This script convert all PDF covers to PNG format.

ls ../*/main.pdf | sed -r 's|/[^/]+$||' | sed -r 's|^../||' | sort | uniq | xargs -I {} convert -density 300 "../{}/main.pdf[0]" -quality 100 "{}.png"

# Special case for `master-thesis` as second page is more interesting.
convert -density 300 "../master-thesis/main.pdf[1]" -quality 100 "master-thesis.png"

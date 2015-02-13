#!/bin/bash

set -e

cat header.html > index.html
curl -Ss -XGET 'https://raw.githubusercontent.com/peterbourgon/gokit/master/README.md' | pandoc --from markdown_github --to html >> index.html
cat footer.html >> index.html


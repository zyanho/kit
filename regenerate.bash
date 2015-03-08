#!/bin/bash

set -e

cat header.html > index.html
curl -Ss -XGET 'https://raw.githubusercontent.com/peterbourgon/gokit/master/README.md' | pandoc --from markdown_github --to html >> index.html
cat footer.html >> index.html

for expr in 's/<br \/>/ /g' 's/[^\^]  / /g'
do
	cat index.html | sed -e "$expr" > index.html.fix
	mv index.html.fix index.html
done

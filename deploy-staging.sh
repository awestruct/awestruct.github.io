#!/bin/sh

rm -Rf _site _tmp
../awestruct/bin/awestruct --url http://staging.awestruct.org/ --force
rsync -rv --delete ./_site/ awestruct.org:/var/www/domains/awestruct.org/staging/htdocs/

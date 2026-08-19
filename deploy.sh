#!/bin/sh
# Publish index.html to the ds.hn apex: the relay serves DSHN_SITE
# (/opt/dshn/site/index.html) on the bare apex and hot-reloads it by mtime,
# so a copy is a deploy — no service restart.
set -e
scp -o BatchMode=yes -J root@ein8.com \
  "$(dirname "$0")/index.html" root@138.252.163.7:/opt/dshn/site/index.html
echo "deployed — verify: curl -s https://ds.hn/ | grep -o '<title>[^<]*'"

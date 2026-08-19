#!/bin/sh
# Publish the site to the ds.hn apex: the relay serves /opt/dshn/site/ on the
# bare apex (index.html at /, en.html at /en, plus flat .css/.js/.svg assets)
# and hot-reloads each file by mtime, so a copy is a deploy — no restart.
set -e
cd "$(dirname "$0")"
scp -o BatchMode=yes -J root@ein8.com \
  index.html en.html site.css root@138.252.163.7:/opt/dshn/site/
echo "deployed — verify: curl -s https://ds.hn/ | grep -o '<title>[^<]*'"

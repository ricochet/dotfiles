#!/bin/bash

# https://github.com/LastPass/lastpass-cli
# lpass login <email>

lpass sync

echo "GITLAB_TOKEN=$(lpass show GITLAB_TOKEN --field=token)"  > ~/.secrets

lpass show .netrc --notes > ~/.netrc

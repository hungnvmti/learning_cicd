#!/bin/bash
set -eux
curl https://cli-assets.heroku.com/install-ubuntu.sh | sh
heroku --version
git --version
heroku git:remote -a m1k

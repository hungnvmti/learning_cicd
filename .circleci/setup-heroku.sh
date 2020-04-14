#!/bin/bash
set -eux
curl https://cli-assets.heroku.com/install-ubuntu.sh | sh
heroku --version
git --version
# heroku git:remote -a m1k
git push https://heroku:d6eb3953-ecaf-4a11-bffd-5db7c4e629ce@git.heroku.com/m1k.git master
heroku run rake db:migrate
sleep 5 # sleep for 5 seconds to wait for dynos
heroku restart

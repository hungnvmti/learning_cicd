#!/bin/bash
set -eux
curl https://cli-assets.heroku.com/install-ubuntu.sh | sh
heroku --version
git --version
git remote -v
heroku login -i
heroku git:remote -a m1k
heroku stack:set heroku-18
git push heroku master
heroku run rake db:migrate
heroku run rake db:seed
sleep 5 # sleep for 5 seconds to wait for dynos
heroku restart

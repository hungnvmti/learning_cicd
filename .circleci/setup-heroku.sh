git push heroku sequential-branch-filter:master
heroku run rake db:migrate
sleep 5 # sleep for 5 seconds to wait for dynos
heroku restart
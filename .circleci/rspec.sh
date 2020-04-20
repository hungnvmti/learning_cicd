#!/bin/bash

set -eux

# AWS Production account
export DOCKER_REPO=1236285767047.dkr.ecr.us-east-2.amazonaws.com
export CONFIG_BUCKET=""
export PRODUCTION_BUCKET="m1k-prd-conf"
export RC_BUCKET="m1k-rc-conf"
export STAGE_BUCKET="m1k-stg-conf"
export DEV_BUCKET="m1k-dev-conf"
export LATEST="latest-dev"

echo "Build Branch: ${CIRCLE_BRANCH}"

configure() {
  case "${CIRCLE_BRANCH}" in
    "prod/release") echo "aws production account"
                    export CONFIG_BUCKET=${PRODUCTION_BUCKET}
                    export LATEST="latest-prd"
                    ;;
    "rc/release") echo "aws devel account"
                    export CONFIG_BUCKET=${RC_BUCKET}
                    export LATEST="latest-rc"
                    set +x
                    export AWS_ACCESS_KEY_ID=${DEV_AWS_ACCESS_KEY_ID}
                    export AWS_SECRET_ACCESS_KEY=${DEV_AWS_SECRET_ACCESS_KEY}
                    ;;
    "stage/release") echo "aws devel account"
                    export CONFIG_BUCKET=${STAGE_BUCKET}
                    export LATEST="latest-stg"
                    set +x
                    export AWS_ACCESS_KEY_ID=${DEV_AWS_ACCESS_KEY_ID}
                    export AWS_SECRET_ACCESS_KEY=${DEV_AWS_SECRET_ACCESS_KEY}
                    ;;
    "dev/release") echo "aws devel account"
                    export CONFIG_BUCKET=${DEV_BUCKET}
                    export LATEST="latest-dev"
                    set +x
                    export AWS_ACCESS_KEY_ID=${DEV_AWS_ACCESS_KEY_ID}
                    export AWS_SECRET_ACCESS_KEY=${DEV_AWS_SECRET_ACCESS_KEY}
                    ;;
    *) echo "unkown branch"
       exit 1
  esac
  set -x
}

clone() {
  git clone -b ${CIRCLE_BRANCH} git@github.com:hungnvmti/learning_cicd.git ~/learning_cicd
}

setup() {
  cd ~/${CIRCLE_PROJECT_REPONAME}
  mv config/database.yml.example config/database.yml
  # mv Gemfile.local.example Gemfile.local
  bundle install --jobs=4 --retry=3 --path vendor/bundle  --without development
}

run() {
  dockerize -wait tcp://127.0.0.1:3306 -timeout 120s
  bundle exec rails db:create
  bundle exec rails db:migrate
  bundle exec rspec
}

rspec() {
  configure
  clone
  setup
  run
}

rspec

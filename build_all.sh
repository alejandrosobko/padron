#!/usr/bin/env sh

set -e
bundle install
rake db:migrate
bundle exec rake

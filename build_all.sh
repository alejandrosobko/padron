#!/usr/bin/env sh

set -e
bundle install
RAILS_ENV=test
bin/rake db:migrate
bundle exec rspec

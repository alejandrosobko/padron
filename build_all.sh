#!/usr/bin/env sh

set -e
bundle install
bin/rake db:migrate RAILS_ENV=test

bundle exec rake secret | xargs echo -e 'test:\n  secret_key_base:' > config/secrets.yml
bundle exec rspec

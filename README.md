Sinatra
=============

Brought to you by Lighthouse Labs

## This branch

This branch was created for the breakout session on May 18, 2016 to
introduce basic acceptance testing and go over how this can be added
to the Sinatra skeleton, and the basic pattern of these tests.

Acceptance testing can save you filling in form fields over and over
manually to test your app's behaviour. They're much higher-level than
unit tests which are generally much more specific and focus on
code concepts (classes, objects, methods). An acceptance test with Capybara
will instead verify very high-level behaviour by interacting with an
application the way a user would and then checking how it "looks".

[Here's a gist with a lot more
detail.](https://gist.github.com/vaz/a50c26831ff9c27911c0923a906cafef)

## Getting Started

1. `bundle install`
2. `RACK_ENV` bundle exec rake db:create
3. `RACK_ENV` bundle exec rake db:migrate
4. `bundle exec rspec`

See `spec/spec_helper.rb` and `spec/acceptance/*` especially for
more detail.

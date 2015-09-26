# EnvPullRequest

[![Gem version][gem-image]][gem-url] [![Travis-CI Status][travis-image]][travis-url]

> Get PULL_REQUEST_ID from environment variables.


## Usage

```ruby
require 'env_pull_request'

env_pull = EnvPullRequest.new
env_pull.pull_request? #=> true
env_pull.pull_request_id #=> 800
```


## API


## Supported services / applications

* Travis-ci
    * `ENV['TRAVIS_PULL_REQUEST']`
    * [Environment Variables - Travis CI](http://docs.travis-ci.com/user/environment-variables/#Convenience-Variables)

* CircleCI
    * `ENV['CIRCLE_PR_NUMBER']`
    * [Environment variables - CircleCI](https://circleci.com/docs/environment-variables#building-pull-requests-that-come-from-forks)


## Changelog

[changelog.md](./changelog.md).


## Installation

Add this line to your application's Gemfile:

```ruby
gem 'env_pull_request'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install env_pull_request


## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake test` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).


## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/packsaddle/ruby-env_pull_request. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](contributor-covenant.org) code of conduct.


## License

© [sanemat](http://sane.jp)

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

[travis-url]: https://travis-ci.org/packsaddle/ruby-env_pull_request
[travis-image]: https://img.shields.io/travis/packsaddle/ruby-env_pull_request/master.svg?style=flat-square&label=build%20%28linux%29
[gem-url]: https://rubygems.org/gems/env_pull_request
[gem-image]: http://img.shields.io/gem/v/env_pull_request.svg?style=flat-square

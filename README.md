# EnvPullRequest

[![Gem version][gem-image]][gem-url] [![Travis-CI Status][travis-image]][travis-url] [![yard docs][docs-image]][docs-url]

> Get PULL_REQUEST_ID from environment variables.


## Usage

```ruby
require 'env_pull_request'

env_pull = EnvPullRequest.new
env_pull.pull_request? #=> true
env_pull.pull_request_id #=> 800
```

### User defined block

```ruby
require 'env_pull_request'
require 'natural_number_string'

env_pull =
  EnvPullRequest.new do
    if NaturalNumberString.positive_integer_string? ENV['PULL_REQUEST_ID']
      ENV['PULL_REQUEST_ID'].to_i
    end
  end
env_pull.pull_request? #=> true
env_pull.pull_request_id #=> 800
```


## API

### EnvPullRequest.new -> Base

### EnvPullRequest.new(&block) -> Base

#### block

*optional*

Type: `block`

User defined block for getting `pull request id`.


### Base#pull_request_id -> Integer | nil

Return pull request id or nil.


### Base#pull_request? -> boolean

Return true if this is pull request.

And more *[details][docs-url]*.


## Supported services / applications

* Travis-ci
    * `ENV['TRAVIS_PULL_REQUEST']`
    * [Environment Variables - Travis CI](http://docs.travis-ci.com/user/environment-variables/#Default-Environment-Variables)
* CircleCI
    * `ENV['CIRCLE_PR_NUMBER']`
    * [Environment variables - CircleCI](https://circleci.com/docs/environment-variables#building-pull-requests-that-come-from-forks)
* Jenkins GitHub pull request builder plugin
    * `ENV['ghprbPullId']`
    * [GitHub pull request builder plugin - Jenkins - Jenkins Wiki](https://wiki.jenkins-ci.org/display/JENKINS/GitHub+pull+request+builder+plugin#GitHubpullrequestbuilderplugin-EnvironmentVariables)


## Related

* [env-branch](https://github.com/packsaddle/ruby-env_branch)


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
[docs-url]: http://www.rubydoc.info/gems/env_pull_request
[docs-image]: https://img.shields.io/badge/yard-docs-blue.svg?style=flat-square

require 'natural_number_string'

require 'env_pull_request/base'
require 'env_pull_request/version'

module EnvPullRequest
  def self.new(&block)
    Base.new(&block)
  end
end

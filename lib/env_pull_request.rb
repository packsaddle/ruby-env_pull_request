require 'natural_number_string'

require 'env_pull_request/base'
require 'env_pull_request/version'

module EnvPullRequest
  # @return [Base]
  # @yield user defined block
  # @example without block
  #   env_pull = EnvPullRequest.new
  # @example with block
  #   env_pull =
  #     EnvPullRequest.new do
  #       if NaturalNumberString.positive_integer_string? ENV['PULL_REQUEST_ID']
  #         ENV['PULL_REQUEST_ID'].to_i
  #       end
  #     end
  def self.new(&block)
    Base.new(&block)
  end
end

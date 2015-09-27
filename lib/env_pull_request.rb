require 'natural_number_string'

require 'env_pull_request/base'
require 'env_pull_request/version'

# Build pull request information from environment variables
module EnvPullRequest
  # Build pull request information object from environment variables
  #
  # @overload self.new
  #   @example without user defined block
  #     env_pull = EnvPullRequest.new
  #
  #   @return [Base]
  #
  # @overload self.new(&block)
  #   @example with user defined block
  #     env_pull =
  #       EnvPullRequest.new do
  #         if NaturalNumberString.positive_integer_string? ENV['PULL_REQUEST_ID']
  #           ENV['PULL_REQUEST_ID'].to_i
  #         end
  #       end
  #
  #   @yield user defined block
  #   @return [Base]
  def self.new(&block)
    Base.new(&block)
  end
end

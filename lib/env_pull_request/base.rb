require 'env_pull_request/utils'

module EnvPullRequest
  class Base
    include Utils
    attr_reader :pull_request_id

    def initialize
      @pull_request_id = fetch_pull_request_id
    end

    def fetch_pull_request_id
      if numeric_string? ENV['TRAVIS_PULL_REQUEST']
        ENV['TRAVIS_PULL_REQUEST'].to_i
      elsif numeric_string? ENV['CIRCLE_PR_NUMBER']
        ENV['CIRCLE_PR_NUMBER'].to_i
      elsif numeric_string? ENV['ghprbPullId']
        ENV['ghprbPullId'].to_i
      end
    end

    def pull_request?
      !pull_request_id.nil?
    end
  end
end

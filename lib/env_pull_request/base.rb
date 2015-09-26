module EnvPullRequest
  class Base
    include NaturalNumberString
    attr_reader :pull_request_id

    def initialize(&block)
      @pull_request_id =
        if block_given?
          block.call || fetch_pull_request_id
        else
          fetch_pull_request_id
        end
    end

    def fetch_pull_request_id
      if positive_integer_string? ENV['TRAVIS_PULL_REQUEST']
        ENV['TRAVIS_PULL_REQUEST'].to_i
      elsif positive_integer_string? ENV['CIRCLE_PR_NUMBER']
        ENV['CIRCLE_PR_NUMBER'].to_i
      elsif positive_integer_string? ENV['ghprbPullId']
        ENV['ghprbPullId'].to_i
      end
    end

    def pull_request?
      !pull_request_id.nil?
    end
  end
end

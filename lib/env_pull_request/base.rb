module EnvPullRequest
  # Pull request information object from environment variables
  class Base
    include NaturalNumberString

    attr_reader :pull_request_id
    # @!attribute [r] pull_request_id
    #   @return [Integer, nil] pull request id or nil

    # Build pull request information object from environment variables
    #
    # @overload initialize
    #   @example without user defined block
    #     env_pull = EnvPullRequest::Base.new
    #
    #   @return [Base] pull request information object
    #
    # @overload initialize(&block)
    #   @example with user defined block
    #     env_pull =
    #       EnvPullRequest::Base.new do
    #         if NaturalNumberString.positive_integer_string? ENV['PULL_REQUEST_ID']
    #           ENV['PULL_REQUEST_ID'].to_i
    #         end
    #       end
    #
    #   @yield user defined block
    #   @return [Base] pull request information object
    def initialize(&block)
      @pull_request_id =
        if block_given?
          block.call || fetch_pull_request_id
        else
          fetch_pull_request_id
        end
    end

    # Fetch pull request id from environment variables
    #
    # @return [Integer, nil] pull request id or nil
    def fetch_pull_request_id
      if positive_integer_string? ENV['TRAVIS_PULL_REQUEST']
        ENV['TRAVIS_PULL_REQUEST'].to_i
      elsif positive_integer_string? ENV['CIRCLE_PR_NUMBER']
        ENV['CIRCLE_PR_NUMBER'].to_i
      elsif positive_integer_string? ENV['ghprbPullId']
        ENV['ghprbPullId'].to_i
      end
    end

    # @return [Boolean] true if this is pull request
    def pull_request?
      !pull_request_id.nil?
    end
  end
end

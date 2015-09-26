module EnvPullRequest
  class Base
    attr_reader :pull_request_id

    def initialize
      @pull_request_id = fetch_pull_request_id
    end

    def fetch_pull_request_id
      if ENV['TRAVIS_PULL_REQUEST'] && ENV['TRAVIS_PULL_REQUEST'].downcase != 'false'
        ENV['TRAVIS_PULL_REQUEST'].to_i
      elsif ENV['CIRCLE_PR_NUMBER']
        ENV['CIRCLE_PR_NUMBER'].to_i
      end
    end

    def pull_request?
      !pull_request_id.nil?
    end
  end
end

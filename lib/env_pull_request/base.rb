module EnvPullRequest
  class Base
    attr_reader :pull_request_id

    def initialize
      @pull_request_id = fetch_pull_request_id
    end

    def fetch_pull_request_id
      nil
    end

    def pull_request?
      !pull_request_id.nil?
    end
  end
end

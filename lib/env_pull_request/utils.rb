module EnvPullRequest
  module Utils
    def numeric_string?(value)
      value && /^\d+$/ =~ value
    end
  end
end

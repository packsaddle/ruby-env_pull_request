module EnvPullRequest
  module Utils
    def numeric_value?(value)
      value && /^\d+$/ =~ value
    end
  end
end

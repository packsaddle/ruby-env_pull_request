module EnvPullRequest
  module Utils
    def integral_string?(value)
      value && /^\d+$/ =~ value
    end
  end
end

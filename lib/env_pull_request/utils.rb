module EnvPullRequest
  module Utils
    def integral_string?(value)
      value && /^\d+$/ =~ value ? true : false
    end
  end
end

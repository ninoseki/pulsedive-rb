require "dotenv/load"

module Pulsedive
  class API

    attr_reader :api_key
    attr_reader :indicator
    attr_reader :threat
    attr_reader :feed

    def initialize(api_key = ENV["PULSEDIVE_API_KEY"])
      raise(ArgumentError, "'api_key' argument is required") unless api_key

      @indicator = Indicator.new(api_key)
      @threat = Threat.new(api_key)
      @feed = Feed.new(api_key)
    end

    def search(params)
      Search.new(api_key).search(params)
    end

    def analyze(ioc, enrich = 1, probe = 1)
      Analyze.new(api_key).analyze(ioc, enrich, probe)
    end
  end
end

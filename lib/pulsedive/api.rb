require "dotenv/load"

module Pulsedive
  class API

    attr_reader :api_key
    attr_reader :indicator
    attr_reader :threat
    attr_reader :feed
    attr_reader :analyze

    def initialize(api_key = ENV["PULSEDIVE_API_KEY"])
      raise(ArgumentError, "'api_key' argument is required") unless api_key

      @indicator = Indicator.new(api_key)
      @threat = Threat.new(api_key)
      @feed = Feed.new(api_key)
      @analyze = Analyze.new(api_key)
    end

    def search(params)
      Search.new(api_key).search(params)
    end
  end
end

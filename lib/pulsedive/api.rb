# frozen_string_literal: true

module Pulsedive
  class API
    attr_reader :api_key

    def initialize(api_key = ENV["PULSEDIVE_API_KEY"])
      raise(ArgumentError, "'api_key' argument is required") unless api_key

      @api_key = api_key
    end

    def indicator
      @indicator ||= Indicator.new(api_key)
    end

    def threat
      @threat ||= Threat.new(api_key)
    end

    def feed
      @feed ||= Feed.new(api_key)
    end

    def analyze
      @analyze ||= Analyze.new(api_key)
    end

    def search(params)
      Search.new(api_key).search(params)
    end
  end
end

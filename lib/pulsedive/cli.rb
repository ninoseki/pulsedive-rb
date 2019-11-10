# frozen_string_literal: true

require "thor"
require "json"

module Pulsedive
  module CLI
    class Base < Thor
      class_option :API_KEY, type: :string

      no_commands do
        def api
          options[:API_KEY] ? API.new(options[:API_KEY]) : API.new
        end

        def with_error_handling
          yield
        rescue ResponseError => e
          puts "Warning: #{e}"
        rescue ArgumentError => _e
          puts "Please provide your Pulsedive API key via --API_KEY or ENV['PULSEDIVE_API_KEY']"
        end
      end
    end

    class Indicator < Base
      desc "get_by_id [ID]", "get indicators by id"
      def get_by_id(id)
        with_error_handling do
          json = api.indicator.get_by_id(id)
          puts JSON.pretty_generate(json)
        end
      end

      desc "get_by_value [VALUE]", "get indicators by value"
      def get_by_value(value)
        with_error_handling do
          json = api.indicator.get_by_value(value)
          puts JSON.pretty_generate(json)
        end
      end

      desc "get_links_by_id [ID]", "get links by id"
      def get_links_by_id(id)
        with_error_handling do
          json = api.indicator.get_links_by_id(id)
          puts JSON.pretty_generate(json)
        end
      end

      desc "get_properties_by_id [ID]", "get properties by id"
      def get_properties_by_id(id)
        with_error_handling do
          json = api.indicator.get_properties_by_id(id)
          puts JSON.pretty_generate(json)
        end
      end
    end

    class Threat < Base
      desc "get_by_id [ID]", "get threat by id"
      def get_by_id(id)
        with_error_handling do
          json = api.threat.get_by_id(id)
          puts JSON.pretty_generate(json)
        end
      end

      desc "get_by_name [NAME]", "get threat by name"
      def get_by_name(name)
        with_error_handling do
          json = api.threat.get_by_name(name)
          puts JSON.pretty_generate(json)
        end
      end

      desc "get_summary_by_id [ID]", "get summary by id"
      def get_summary_by_id(id)
        with_error_handling do
          json = api.threat.get_summary_by_id(id)
          puts JSON.pretty_generate(json)
        end
      end

      desc "get_linked_indicators_by_id [ID]", "get linked indicators by id"
      def get_linked_indicators_by_id(id)
        with_error_handling do
          json = api.threat.get_linked_indicators_by_id(id)
          puts JSON.pretty_generate(json)
        end
      end
    end

    class Feed < Base
      desc "get_by_id [ID]", "get feed by id"
      def get_by_id(id)
        with_error_handling do
          json = api.feed.get_by_id(id)
          puts JSON.pretty_generate(json)
        end
      end

      desc "get_linked_indicators_by_id [ID]", "get linked indicators by id"
      def get_linked_indicators_by_id(id)
        with_error_handling do
          json = api.feed.get_linked_indicators_by_id(id)
          puts JSON.pretty_generate(json)
        end
      end
    end

    class Analyze < Base
      option :enrich, type: :numeric
      option :probe, type: :numeric
      desc "add_to_queue [IOC]", "add ioc to the queue for analysis"
      def add_to_queue(ioc)
        enrich = options[:enrich] || 1
        probe = options[:probe] || 1
        with_error_handling do
          json = api.analyze.add_to_queue(ioc, enrich: enrich, probe: probe)
          puts JSON.pretty_generate(json)
        end
      end

      desc "get_results_by_id [ID]", "get analyze result"
      def get_results_by_id(id)
        with_error_handling do
          json = api.analyze.get_results_by_id(id)
          puts JSON.pretty_generate(json)
        end
      end
    end

    class Main < Thor
      desc "indicator [COMMAND]", "indicator [COMMAND](get_by_id, get_by_value, get_links_by_id, get_properties_by_id)"
      subcommand "indicator", Indicator

      desc "threat [COMMAND]", "threat [COMMAND](get_by_id get_by_name, get_linked_indicators_by_id, get_summary_by_id)"
      subcommand "threat", Threat

      desc "feed [COMMAND]", "feed [COMMAND](get_by_id, get_linked_indicators_by_id)"
      subcommand "feed", Feed

      desc "analyze [COMMAND]", "analyze [COMMAND](add_to_queue, get_results_by_id)"
      subcommand "analyze", Analyze
    end
  end
end

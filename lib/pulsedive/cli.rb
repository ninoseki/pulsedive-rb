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
        rescue ArugemtnError => _
          puts "Please set your Pulsedive API key vai ENV['PULSEDIVE_API_KEY'] or --API_KEY"
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

    class Main < Base
      desc "indicator SUBCOMMAND", "indicator commands"
      subcommand "indicator", Indicator

      desc "threat SUBCOMMAND", "threat commands"
      subcommand "threat", Threat

      desc "feed SUBCOMMAND", "feed commands"
      subcommand "feed", Feed

      option :enrich, type: :numeric
      option :probe, type: :numeric
      desc "analyze [IOC]", "analyze ioc"
      def analyze(ioc)
        enrich = options[:enrich] || 1
        probe = options[:probe] || 1
        with_error_handling do
          json = api.analyze(ioc, enrich, probe)
          puts JSON.pretty_generate(json)
        end
      end
    end
  end
end

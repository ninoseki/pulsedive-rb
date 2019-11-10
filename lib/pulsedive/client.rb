# frozen_string_literal: true

require 'net/https'
require 'active_support'
require 'active_support/core_ext/hash'

module Pulsedive
  class Client
    attr_reader :api_key

    HOST = "pulsedive.com"
    URL = "https://#{HOST}"

    def initialize(api_key)
      @api_key = api_key
    end

    private

    def url_for(path)
      URI(URL + path)
    end

    def https_options
      if proxy = ENV["HTTPS_PROXY"] || ENV["https_proxy"]
        uri = URI(proxy)
        {
          proxy_address: uri.hostname,
          proxy_port: uri.port,
          proxy_from_env: false,
          use_ssl: true
        }
      else
        { use_ssl: true }
      end
    end

    def request(req)
      Net::HTTP.start(HOST, 443, https_options) do |http|
        response = http.request(req)
        if response.code != "200"
          raise(ResponseError, "Unsupported response code returned: #{response.code}")
        end

        json = JSON.parse(response.body)
        raise(ResponseError, json["error"]) if json["error"]

        yield json
      end
    end

    def get(path, params, &block)
      params["key"] = api_key

      url = url_for(path)
      url.query = params.to_query
      get = Net::HTTP::Get.new(url)
      request(get, &block)
    end

    def post(path, params, &block)
      params["key"] = api_key

      post = Net::HTTP::Post.new(url_for(path))
      post.body = URI.encode_www_form(params)
      request(post, &block)
    end
  end
end

# frozen_string_literal: true

module Pulsedive
  class Indicator < Client
    def get_by_id(iid, schema = 1)
      params = {
        "iid": iid,
        "schema": schema
      }
      get("/api/info.php", params) { |json| json }
    end

    def get_by_value(indicator)
      params = {
        "indicator": indicator
      }
      get("/api/info.php", params) { |json| json }
    end

    def get_links_by_id(iid, page = 0)
      params = {
        "iid": iid,
        "get": "links",
        "page": page
      }
      get("/api/info.php", params) { |json| json }
    end

    def get_properties_by_id(iid)
      params = {
        "iid": iid,
        "get": "properties"
      }
      get("/api/info.php", params) { |json| json }
    end
  end
end

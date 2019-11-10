# frozen_string_literal: true

module Pulsedive
  class Feed < Client
    def get_by_id(fid)
      params = {
        "fid": fid
      }
      get("/api/info.php", params) { |json| json }
    end

    def get_linked_indicators_by_id(fid, page: 0)
      params = {
        "fid": fid,
        "get": "links",
        "page": page
      }
      get("/api/info.php", params) { |json| json }
    end
  end
end

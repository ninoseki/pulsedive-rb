module Pulsedive
  class Threat < Client
    def get_by_id(tid)
      params = {
        "tid": tid
      }
      get("/api/info.php", params) { |json| json }
    end

    def get_by_name(tname)
      params = {
        "tname": tname
      }
      get("/api/info.php", params) { |json| json }
    end

    def get_summary_by_id(tld)
      params = {
        "tid": tld,
        "get": "links",
        "summary": "1",
        "splitrisk": "1"
      }
      get("/api/info.php", params) { |json| json }
    end

    def get_linked_indicators_by_id(tld)
      params = {
        "tid": tld,
        "get": "links"
      }
      get("/api/info.php", params) { |json| json }
    end
  end
end

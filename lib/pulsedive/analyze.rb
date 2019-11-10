# frozen_string_literal: true

require "base64"

module Pulsedive
  class Analyze < Client
    def add_to_queue(ioc, enrich = 1, probe = 1)
      params = {
        "ioc": Base64.strict_encode64(ioc),
        "enrich": enrich,
        "probe": probe,
      }
      post("/api/analyze.php", params) { |json| json }
    end

    def get_results_by_id(id)
      params = {
        qid: id
      }
      get("/api/analyze.php", params) { |json| json }
    end
  end
end

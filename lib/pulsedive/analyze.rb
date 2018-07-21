require "base64"

module Pulsedive
  class Analyze < Client
    def analyze(ioc, enrich = 1, probe = 1)
      params = {
        "ioc": Base64.strict_encode64(ioc),
        "enrich": enrich,
        "probe": probe,
      }
      post("/api/analyze.php", params) { |json| json }
    end
  end
end

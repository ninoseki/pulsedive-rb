module Pulsedive
  class Search < Client
    def search(params)
      get("/api/search.php", params) { |json| json }
    end
  end
end

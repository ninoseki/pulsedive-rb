# frozen_string_literal: true

describe Pulsedive::API, :vcr do
  describe "#search" do
    it do
      params = {
        "search": "feed",
        "value": "zeus",
        "category": [
          "general", "abuse", "attack", "botnet", "crime",
          "fraud", "group", "malware", "proxy", "pup",
          "reconnaissance", "spam", "terrorism", "vulnerability"
        ],
        "splitrisk": "1",
      }
      json = subject.search(params)
      expect(json["results"]).to be_a(Array)
    end
  end
end

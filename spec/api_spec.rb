describe Pulsedive::API, :vcr do
  context "indicator" do
    describe "#get_by_id" do
      it "should return a valid JSON" do
        json = subject.indicator.get_by_id(2);
        expect(json["iid"]).to eq(2)
      end
    end
    describe "#get_by_value" do
      it "should return a valid JSON" do
        json = subject.indicator.get_by_value("pulsedive.com")
        expect(json["indicator"]).to eq("pulsedive.com")
      end
    end
    describe "#get_links_by_id" do
      it "should return a valid JSON" do
        json = subject.indicator.get_links_by_id(2)
        expect(json["Active DNS"]).to be_a(Array)
      end
    end
    describe "#get_properties_by_id" do
      it "should return a valid JSON" do
        json = subject.indicator.get_properties_by_id(2)
        expect(json["dns"]).to be_a(Array)
      end
    end
  end
  context "threat" do
    describe "#get_by_id" do
      it "should return a valid JSON" do
        json = subject.threat.get_by_id(1)
        expect(json["tid"]).to eq(1)
      end
    end
    describe "#get_by_name" do
      it "should return a valid JSON" do
        json = subject.threat.get_by_name("Zeus")
        expect(json["threat"]).to eq("Zeus")
      end
    end
    describe "#get_summary_by_id" do
      it "should return a valid JSON" do
        json = subject.threat.get_summary_by_id(1)
        expect(json["risk"]).to be_a(Hash)
      end
    end
    describe "#get_linked_indicators_by_id" do
      it "should return a valid JSON" do
        json = subject.threat.get_linked_indicators_by_id(1)
        expect(json["results"]).to be_a(Array)
      end
    end
  end
  context "feed" do
    describe "#get_by_id" do
      it "should return a valid JSON" do
        json = subject.feed.get_by_id(1)
        expect(json["fid"]).to eq(1)
      end
    end
    describe "#get_linked_indicators_by_id" do
      it "should return a valid JSON" do
        json = subject.feed.get_linked_indicators_by_id(1)
        expect(json["results"]).to be_a(Array)
      end
    end
  end
  describe "#search" do
    it "should return a valid JSON" do
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
  describe "#analyze" do
    it "should return a valid JSON" do
      json = subject.analyze("pulsedive.com")
      expect(json["success"]).to eq("Added  to queue.")
      expect(json["qid"]).to be_a(Numeric)
    end
  end
end

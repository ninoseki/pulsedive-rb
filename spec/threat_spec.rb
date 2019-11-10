# frozen_string_literal: true

describe Pulsedive::Threat, :vcr do
  let(:api) { Pulsedive::API.new }

  describe "#get_by_id" do
    it do
      json = api.threat.get_by_id(1)
      expect(json["tid"]).to eq(1)
    end
  end

  describe "#get_by_name" do
    it do
      json = api.threat.get_by_name("Zeus")
      expect(json["threat"]).to eq("Zeus")
    end
  end

  describe "#get_summary_by_id" do
    it do
      json = api.threat.get_summary_by_id(1)
      expect(json["risk"]).to be_a(Hash)
    end
  end

  describe "#get_linked_indicators_by_id" do
    it do
      json = api.threat.get_linked_indicators_by_id(1)
      expect(json["results"]).to be_a(Array)
    end
  end
end

# frozen_string_literal: true

describe Pulsedive::Feed, :vcr do
  let(:api) { Pulsedive::API.new }

  describe "#get_by_id" do
    it do
      json = api.feed.get_by_id(1)
      expect(json["fid"]).to eq(1)
    end
  end

  describe "#get_linked_indicators_by_id" do
    it do
      json = api.feed.get_linked_indicators_by_id(1)
      expect(json["results"]).to be_a(Array)
    end
  end
end

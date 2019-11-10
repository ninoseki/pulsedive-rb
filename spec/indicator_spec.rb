# frozen_string_literal: true

describe Pulsedive::Indicator, :vcr do
  let(:api) { Pulsedive::API.new }

  describe "#get_by_id" do
    it do
      json = api.indicator.get_by_id(2);
      expect(json["iid"]).to eq(2)
    end
  end

  describe "#get_by_value" do
    it do
      json = api.indicator.get_by_value("pulsedive.com")
      expect(json["indicator"]).to eq("pulsedive.com")
    end
  end

  describe "#get_links_by_id" do
    it do
      json = api.indicator.get_links_by_id(2)
      expect(json["Active DNS"]).to be_a(Array)
    end
  end

  describe "#get_properties_by_id" do
    it do
      json = api.indicator.get_properties_by_id(2)
      expect(json["dns"]).to be_a(Array)
    end
  end
end

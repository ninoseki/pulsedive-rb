# frozen_string_literal: true

describe Pulsedive::Analyze, :vcr do
  let(:api) { Pulsedive::API.new }

  describe "#add_to_queue" do
    it do
      json = api.analyze.add_to_queue("pulsedive.com")
      expect(json["qid"]).to be_a(Integer)
    end
  end

  describe "#get_results_by_id" do
    it do
      json = api.analyze.get_results_by_id(95_665_220)
      expect(json["qid"]).to eq(95_665_220.to_s)
    end
  end
end

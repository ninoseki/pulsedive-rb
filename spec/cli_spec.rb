# frozen_string_literal: true

require "json"

describe Pulsedive::CLI::Main, :vcr do
  context "with indicator" do
    describe "#get_by_id" do
      it do
        output = capture(:stdout) { described_class.start %w(indicator get_by_id 2) }
        json = JSON.parse(output)
        expect(json).to be_a(Hash)
      end
    end

    describe "#get_by_value" do
      it do
        output = capture(:stdout) { described_class.start %w(indicator get_by_value pulsedive.com) }
        json = JSON.parse(output)
        expect(json).to be_a(Hash)
      end
    end

    describe "#get_links_by_id" do
      it do
        output = capture(:stdout) { described_class.start %w(indicator get_links_by_id 2) }
        json = JSON.parse(output)
        expect(json).to be_a(Hash)
      end
    end

    describe "#get_properties_by_id" do
      it do
        output = capture(:stdout) { described_class.start %w(indicator get_properties_by_id 2) }
        json = JSON.parse(output)
        expect(json).to be_a(Hash)
      end
    end
  end

  context "with threat" do
    describe "#get_by_id" do
      it do
        output = capture(:stdout) { described_class.start %w(threat get_by_id 1) }
        json = JSON.parse(output)
        expect(json).to be_a(Hash)
      end
    end

    describe "#get_by_name" do
      it do
        output = capture(:stdout) { described_class.start %w(threat get_by_name Zeus) }
        json = JSON.parse(output)
        expect(json).to be_a(Hash)
      end
    end

    describe "#get_summary_by_id" do
      it do
        output = capture(:stdout) { described_class.start %w(threat get_summary_by_id 1) }
        json = JSON.parse(output)
        expect(json).to be_a(Hash)
      end
    end

    describe "#get_linked_indicators_by_id" do
      it do
        output = capture(:stdout) { described_class.start %w(threat get_linked_indicators_by_id 1) }
        json = JSON.parse(output)
        expect(json).to be_a(Hash)
      end
    end
  end

  context "with feed" do
    describe "#get_by_id" do
      it do
        output = capture(:stdout) { described_class.start %w(feed get_by_id 1) }
        json = JSON.parse(output)
        expect(json).to be_a(Hash)
      end
    end

    describe "#get_linked_indicators_by_id" do
      it do
        output = capture(:stdout) { described_class.start %w(feed get_linked_indicators_by_id 1) }
        json = JSON.parse(output)
        expect(json).to be_a(Hash)
      end
    end
  end

  context "with analyze" do
    describe "#add_to_queue" do
      it do
        output = capture(:stdout) { described_class.start %w(analyze add_to_queue pulsedive.com) }
        json = JSON.parse(output)
        expect(json).to be_a(Hash)
      end
    end

    describe "#get_results_by_id" do
      it do
        output = capture(:stdout) { described_class.start %w(analyze get_results_by_id 95665220) }
        json = JSON.parse(output)
        expect(json).to be_a(Hash)
      end
    end
  end
end

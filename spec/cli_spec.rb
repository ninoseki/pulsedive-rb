require "json"

describe Pulsedive::CLI::Main, :vcr do
  context "indicator" do
    describe "#get_by_id" do
      it "should output a valid JSON" do
        output = capture(:stdout) { Pulsedive::CLI::Main.start %w(indicator get_by_id 2) }
        json = JSON.parse(output)
        expect(json).to be_a(Hash)
      end
    end
    describe "#get_by_value" do
      it "should output a valid JSON" do
        output = capture(:stdout) { Pulsedive::CLI::Main.start %w(indicator get_by_value pulsedive.com) }
        json = JSON.parse(output)
        expect(json).to be_a(Hash)
      end
    end
    describe "#get_links_by_id" do
      it "should output a valid JSON" do
        output = capture(:stdout) { Pulsedive::CLI::Main.start %w(indicator get_links_by_id 2) }
        json = JSON.parse(output)
        expect(json).to be_a(Hash)
      end
    end
    describe "#get_properties_by_id" do
      it "should output a valid JSON" do
        output = capture(:stdout) { Pulsedive::CLI::Main.start %w(indicator get_properties_by_id 2) }
        json = JSON.parse(output)
        expect(json).to be_a(Hash)
      end
    end
  end
  context "threat" do
    describe "#get_by_id" do
      it "should output a valid JSON" do
        output = capture(:stdout) { Pulsedive::CLI::Main.start %w(threat get_by_id 1) }
        json = JSON.parse(output)
        expect(json).to be_a(Hash)
      end
    end
    describe "#get_by_name" do
      it "should output a valid JSON" do
        output = capture(:stdout) { Pulsedive::CLI::Main.start %w(threat get_by_name Zeus) }
        json = JSON.parse(output)
        expect(json).to be_a(Hash)
      end
    end
    describe "#get_summary_by_id" do
      it "should output a valid JSON" do
        output = capture(:stdout) { Pulsedive::CLI::Main.start %w(threat get_summary_by_id 1) }
        json = JSON.parse(output)
        expect(json).to be_a(Hash)
      end
    end
    describe "#get_linked_indicators_by_id" do
      it "should output a valid JSON" do
        output = capture(:stdout) { Pulsedive::CLI::Main.start %w(threat get_linked_indicators_by_id 1) }
        json = JSON.parse(output)
        expect(json).to be_a(Hash)
      end
    end
  end
  context "feed" do
    describe "#get_by_id" do
      it "should output a valid JSON" do
        output = capture(:stdout) { Pulsedive::CLI::Main.start %w(feed get_by_id 1) }
        json = JSON.parse(output)
        expect(json).to be_a(Hash)
      end
    end
    describe "#get_linked_indicators_by_id" do
      it "should output a valid JSON" do
        output = capture(:stdout) { Pulsedive::CLI::Main.start %w(feed get_linked_indicators_by_id 1) }
        json = JSON.parse(output)
        expect(json).to be_a(Hash)
      end
    end
  end
  context "analyze" do
    describe "#add_to_queue" do
      it "should output a valid JSON" do
        output = capture(:stdout) { Pulsedive::CLI::Main.start %w(analyze add_to_queue pulsedive.com) }
        json = JSON.parse(output)
        expect(json).to be_a(Hash)
      end
    end
    describe "#get_results_by_id" do
      it "should output a valid JSON" do
        output = capture(:stdout) { Pulsedive::CLI::Main.start %w(analyze get_results_by_id 11793439) }
        json = JSON.parse(output)
        expect(json).to be_a(Hash)
      end
    end
  end
end

require 'spec_helper'
require 'Opennorth/represent/models/offices'

describe Opennorth::Represent::Offices, type: :collection do
  let(:service) { Opennorth::Represent.new({}) }

  let(:sample_set) { service.get_postal_code("V6H2V4").body["representatives_centroid"].last["offices"] }


  context "loaded with sample data" do

    let(:loaded_collection) { described_collection.load(sample_set) }

    describe "#where" do
      subject { loaded_collection.where(type: "legislature") }

      it "should return a collection" do
        expect(subject).to have(1).item
      end

      it "should contain only matches" do
        expect(subject).to be_all {|rep| rep.type == "legislature"}
      end
    end
  end
end

require 'spec_helper'
require 'opennorth/represent/models/representatives'

describe Opennorth::Represent::Representatives, type: :collection do
  let(:service) { Opennorth::Represent.new({}) }

  let(:sample_set) { service.get_postal_code("V6H2V4").body["representatives_centroid"] }


  context "loaded with sample data" do

    let(:loaded_collection) { described_collection.load(sample_set) }

    describe "#where" do
      subject { loaded_collection.where(elected_office: "MP") }

      it "should return a collection" do
        expect(subject).to have(1).item
      end

      it "should contain only matches" do
        expect(subject).to be_all {|rep| rep.elected_office == "MP"}
      end
    end
  end
end

require 'spec_helper'
require 'opennorth/represent/models/postal_codes'

describe Opennorth::Represent::PostalCodes, type: :collection do
  let(:service) { Opennorth::Represent.new({}) }

  describe "#get" do
    subject { described_collection.get("V6H2V4") }

    it "should have a the code we asked to get" do
      expect(subject.code).to eql("V6H2V4")
    end

    it "should have the code as the id" do
      expect(subject.identity).to eql("V6H2V4")
    end

    it "should have a province" do
      expect(subject.province).to eql("BC")
    end

    it "should have a city" do
      expect(subject.city).to eql("Vancouver")
    end

    it "should have representatives" do
      expect(subject.representatives).to have(13).items
    end
  end
end

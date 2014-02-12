require 'spec_helper'
require 'opennorth/represent/models/postal_code'
require 'opennorth/represent/models/representative'

describe Opennorth::Represent::PostalCode, type: :model do
  let(:service) { Opennorth::Represent.new({}) }

  describe "#representatives" do
    subject { service.postal_codes.get("V6H2V4").representatives }

    it "should be composed of Representatives" do
      expect(subject).to be_composed_of(Opennorth::Represent::Representative)
    end
  end
end

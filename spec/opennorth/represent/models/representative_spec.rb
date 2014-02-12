require 'spec_helper'
require 'opennorth/represent/models/representative'

describe Opennorth::Represent::Representative, type: :model do
  let(:service) { Opennorth::Represent.new({}) }
  let(:required_model_attributes) {{
    "name" => "Stephen Harper",
    "district_name" => "Calgary Southwest",
    "elected_office" => "MP",
    "source_url" => "http://badnews.ca"
  }}

  it_behaves_like "required model attributes include", %w(name district_name elected_office source_url)

  let(:optional_model_attributes) {{
    "offices" => [
      {
        "type" => "legislature",
        "fax" => "1-613-941-6900",
        "postal" => "House of Commons\nOttawa ON  K1A 0A6",
        "tel" => "1-613-992-4211"
      },
      {
        "type" => "constituency",
        "fax" => "1-403-253-8203",
        "postal" => "1600 - 90th Avenue SW, Suite A-203\nCalgary AB  T2V 5A8",
        "tel" => "1-403-253-7990"
      }
    ],
    "extra" => {
      "honorific_prefix" => "Right Hon.",
      "preferred_language" => "English"
    }
  }}

  describe "optionally" do
    it "may have a first_name"
    it "may have a last_name"
    it "may have a party_name"
    it "may have an email"
    it "may have a url"
    it "may have a photo_url"
    it "may have a personal_url"
    it "may have a district_id"
    it "may have a geneder"

    it "may have offices" do
      expect(subject.offices).to have(2).items

      expect(described_class.new(model_options.reject {|k,_| k == 'offices'}).offices).to be_empty
    end
  end

  describe "#offices" do

    subject { record.offices }

    it "should be composed of Offices" do
      expect(subject).to be_composed_of(Opennorth::Represent::Office)
    end
  end

  describe "#honorific_prefix" do
    it "should be retrieved from the extra" do
      expect(record.honorific_prefix).to eql("Right Hon.")
    end
  end

  describe "#preferred_language" do
    it "should be retrieved from the extra" do
      expect(record.preferred_language).to eql("English")
    end
  end
end

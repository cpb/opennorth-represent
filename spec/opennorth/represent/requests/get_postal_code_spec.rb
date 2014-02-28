require 'spec_helper'

describe Opennorth::Represent, "#get_postal_code", type: :request  do
  let(:service_options) {{}}
  context "success" do
    subject { described_request("V6H2V4") }

    it "should be status 200" do
      expect(subject.status).to eql(200)
    end

    it "should be formatted as a postal code response" do
      expect(subject.body).to be_formatted_like({
        "province" => String,
        "city" => String,
        "boundaries_centroid" => Array,
        "code" => String,
        "centroid" => Hash,
        "representatives_centroid" => Array,
        "boundaries_concordance" => Array
      })
    end
  end
end

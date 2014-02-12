require 'spec_helper'
require 'opennorth/represent/models/office'

describe Opennorth::Represent::Office, type: :model do
  let(:service) { Opennorth::Represent.new({}) }

  let(:required_model_attributes) { {} }
  let(:optional_model_attributes) {{
    "type" => "legislature",
    "fax" => "1-613-941-6900",
    "postal" => "House of Commons\nOttawa ON  K1A 0A6",
    "tel" => "1-613-992-4211"
  }}

  it_behaves_like "optional model attributes include", %w(type fax postal tel)
end

shared_examples_for type: :model do |context|
  let(:model_options) { optional_model_attributes.merge(required_model_attributes.merge(service: service)) }

  let(:record) { described_class.new(model_options) }
  subject { record }
end

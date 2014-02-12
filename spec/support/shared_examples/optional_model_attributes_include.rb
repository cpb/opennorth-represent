shared_examples_for "optional model attributes include" do |set_of_attributes|
  set_of_attributes.each do |attribute|
    it attribute do
      expect(record.send(attribute)).to eql(optional_model_attributes[attribute])

      sans_attribute = model_options.reject {|k,_| k == attribute}
      expect(described_class.new(sans_attribute).send(attribute)).to be_nil
    end
  end
end

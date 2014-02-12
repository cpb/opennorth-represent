shared_examples_for "required model attributes include" do |set_of_attributes|
  set_of_attributes.each do |attribute|
    it attribute do
      sans_attribute = model_options.reject {|k,_| k == attribute}
      expect do
        described_class.new(sans_attribute).validate!
      end.to raise_error(ArgumentError, /#{attribute} is required/)
    end
  end
end

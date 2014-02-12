RSpec::Matchers.define :be_composed_of do |expected_class|
  match do |actual|
    expect(actual).to_not be_empty
    actual.all? {|item| item.is_a?(expected_class) }
  end
end

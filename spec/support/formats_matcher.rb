require 'fog/schema/data_validator'
require File.join(File.dirname(Gem::Specification.find_by_name("fog").load_paths.first),"tests","helpers","formats_helper")

Dir[File.join(File.dirname(__FILE__),"formats","**","*.rb")].each { |f| require f }

RSpec::Matchers.define :be_formatted_like do |expected|
  match do |actual|
    @validator = Fog::Schema::DataValidator.new
    @validator.validate(actual, expected, {})
  end
end

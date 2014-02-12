$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'opennorth/represent'
require 'pry'

require 'rspec/collection_matchers'

require 'simplecov'

Dir[File.join(File.dirname(__FILE__),"support","**","*.rb")].each { |f| require f }

RSpec.configure do |c|
  c.before do
    if ENV['FOG_MOCK'] == "true"
      Fog.mock!
      Fog::Mock.reset
    end
  end
end

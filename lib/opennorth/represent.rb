require "fog"

module Opennorth
  class Represent < Fog::Service
    # Your code goes here...
    VERSION = File.read(File.join(File.dirname(__FILE__),"..","..","VERSION"))

    class Real
      def initialize(options={})

      end
    end

    class Mock
      def initialize(options={})

      end
    end
  end
end

require "fog"

module Opennorth
  class Represent < Fog::Service
    # Your code goes here...
    VERSION = File.read(File.join(File.dirname(__FILE__),"..","..","VERSION"))

    BASE_URL = "http://represent.opennorth.ca".freeze

    request_path "opennorth/represent/requests"
    request :get_postal_code

    class Real
      def initialize(options={})
        @connection = Fog::Connection.new(BASE_URL,false,connection_options)
      end

      def request(options={})
        connection.request(options)
      end

      private
      attr_reader :connection

      def connection_options
        options = {}
        options.merge!(proxy: ENV["FOG_PROXY"]) if ENV["FOG_PROXY"]
        options
      end

    end

    class Mock
      def initialize(options={})

      end
    end
  end
end

require 'opennorth/represent/models/offices'

module Opennorth
  class Represent
    class Representative < Fog::Model

      attribute :name,           type: :string
      attribute :district_name,  type: :string
      attribute :elected_office, type: :string
      attribute :source_url,     type: :string

      attribute :offices,        type: :array

      attribute :extra

      def validate!
        requires :name, :district_name, :elected_office, :source_url
      end

      def offices
        attributes.fetch(:offices) { attributes[:offices] = Opennorth::Represent::Offices.new(service: service).load([]) }
      end

      def offices=(new_offices)
        self.offices.clear
        self.offices.load(new_offices)
      end

      def honorific_prefix
        self.extra["honorific_prefix"]
      end

      def preferred_language
        self.extra["preferred_language"]
      end
    end
  end
end

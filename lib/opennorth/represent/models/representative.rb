require 'opennorth/represent/models/offices'

module Opennorth
  class Represent
    class Representative < Fog::Model

      attribute :name,           type: :string
      attribute :district_name,  type: :string
      attribute :elected_office, type: :string
      attribute :source_url,     type: :string

      attribute :offices,        type: :array

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
    end
  end
end

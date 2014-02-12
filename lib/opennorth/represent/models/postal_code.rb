require 'opennorth/represent/models/representatives'

module Opennorth
  class Represent
    class PostalCode < Fog::Model
      identity  :code,     type: :string
      attribute :province, type: :string
      attribute :city,     type: :string

      attribute :representatives, type: :array, aliases: %w(representatives_centroid)

      def representatives=(representative_set)
        attributes[:representatives] ||= Opennorth::Represent::Representatives.new(service: service)

        self.representatives.clear
        self.representatives.load(representative_set)
      end
    end
  end
end

require 'opennorth/represent/models/postal_code'

module Opennorth
  class Represent
    class PostalCodes < Fog::Collection
      model Opennorth::Represent::PostalCode

      def get(postal_code)
        new.merge_attributes(service.get_postal_code(postal_code).body)
      end
    end
  end
end

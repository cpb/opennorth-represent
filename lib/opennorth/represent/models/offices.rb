require 'opennorth/represent/models/office'

module Opennorth
  class Represent
    class Offices < Fog::Collection
      model Opennorth::Represent::Office

      def where(attribute_value_map)
        select do |rep|
          attribute_value_map.all? do |(attribute, value)|
            rep.send(attribute) == value
          end
        end
      end
    end
  end
end

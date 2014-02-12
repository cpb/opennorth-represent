require 'opennorth/represent/models/representative'

module Opennorth
  class Represent
    class Representatives < Fog::Collection
      model Opennorth::Represent::Representative

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

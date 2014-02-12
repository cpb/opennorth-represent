require 'opennorth/represent/models/representative'

module Opennorth
  class Represent
    class Representatives < Fog::Collection
      model Opennorth::Represent::Representative

    end
  end
end

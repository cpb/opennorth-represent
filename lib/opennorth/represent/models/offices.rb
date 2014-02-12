require 'opennorth/represent/models/office'

module Opennorth
  class Represent
    class Offices < Fog::Collection
      model Opennorth::Represent::Office

    end
  end
end

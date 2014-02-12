module Opennorth
  class Represent
    class Office < Fog::Model

      attribute :type,   type: :string
      attribute :fax,    type: :string
      attribute :postal, type: :string
      attribute :tel,    type: :string
    end
  end
end

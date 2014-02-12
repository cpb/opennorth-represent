module Opennorth
  class Represent
    class PostalCode < Fog::Model
      identity  :code,     type: :string
      attribute :province, type: :string
      attribute :city,     type: :string
    end
  end
end

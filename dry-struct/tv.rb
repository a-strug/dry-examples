module DryStruct
  module Types
    include Dry.Types()
  end

  class Tv < Dry::Struct
    transform_keys(&:to_sym)

    attribute :model, Types::String
    attribute? :description, Types::String.optional
    attribute :price, Types::Coercible::Float
  end
end

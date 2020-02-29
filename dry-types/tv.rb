module DryTypes
  module Types
    include Dry.Types()
  end

  class Tv < Dry::Struct
    attribute :model, Types::Coercible::String
    attribute :price, Types::Strict::Float.constrained(gteq: 10_000.0)
    attribute? :description, Types::String.optional
  end
end

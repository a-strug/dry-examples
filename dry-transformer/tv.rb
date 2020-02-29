module DryTransformer
  class Tv < Dry::Transformer::Pipe
    import Dry::Transformer::HashTransformations

    define! do
      symbolize_keys
      rename_keys m: :model
      nest :display, [:inch_diagonal]
    end
  end
end

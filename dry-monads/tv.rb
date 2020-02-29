include Dry::Monads[:maybe, :result]

module DryMonads
  module Types
    include Dry.Types()
  end

  class Tv
    include Dry::Monads[:maybe, :result]

    extend Dry::Initializer

    option :model, Types::Strict::String.optional, optional: true

    def valid?
      @model != Dry::Initializer::UNDEFINED
    end

    def validate
      if valid?
        Success(self)
      else
        Failure("Invalid model")
      end
    end

    def yield_sell(some_condition)
      yield validate
      yield sell(some_condition)

      Success(self)
    end

    def sell(some_condition)
      if some_condition == true
        Success(self)
      else
        Failure[self, params: some_condition]
      end
    end

    def maybe_sell
      if @model != Dry::Initializer::UNDEFINED
        Some("Sold #{self.inspect}")
      else
        None()
      end
    end

    def result_sell
      if @model != Dry::Initializer::UNDEFINED
        Success("Sold #{self.inspect}")
      else
        Failure("Invalid model")
      end
    end
  end
end

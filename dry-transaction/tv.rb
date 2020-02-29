module DryTransaction
  class GlobalContainer
    extend Dry::Container::Mixin

    namespace "tv" do
      register "validate" do
        Tv::Validate.new
      end

      register "create" do
        Tv::Create.new
      end
    end
  end

  class Tv < Dry::Struct
    module Types
      include Dry.Types()
    end

    attribute :inch_diagonal, Types::Float
    attribute :pixel_width, Types::Integer
    attribute :pixel_height, Types::Integer

    class Validate
      include Dry::Transaction::Operation

      def call(params)
        if params[:inch_diagonal].is_a?(Float) &&
            params[:pixel_height].is_a?(Integer) &&
            params[:pixel_width].is_a?(Integer)
          Success(params)
        else
          Failure("invalid params: #{params.inspect}")
        end
      end
    end

    class Create
      include Dry::Transaction::Operation

      def call(params)
        if tv = Tv.new(params)
          Success(tv)
        else
          Failure("Ops, something went wrong")
        end
      end
    end

    class Builder
      include Dry::Transaction(container: DryTransaction::GlobalContainer)

       step :validate, with: "tv.validate"
       step :create,   with: "tv.create"
    end
  end
end

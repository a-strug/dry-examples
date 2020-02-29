module DryValidation
  class Tv < Dry::Validation::Contract
    Dry::Validation.register_macro(:email_format) do
      return unless key?
      unless /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i.match?(value)
        key.failure('not a valid email format')
      end
    end

    schema do
      required(:model).value(:string)
      required(:price).value(:float)
      optional(:customer_email).value(:string)
      optional(:description).value(:string)
    end

    rule(:customer_email).validate(:email_format)

    rule(:price) do
      key.failure("Must be between 10000.0 and 100000.0") unless values[:price].between?(10_000, 100_000)
    end
  end
end

module DrySchema
  TvSchema = Dry::Schema.Params do
    required(:model).filled(:string)
    required(:price).filled(:float)
    required(:display).hash do
      required(:inch_diagonal).filled(:float)
      required(:pixel_width).filled(:integer)
      required(:pixel_height).filled(:integer)
    end
  end
end

class DryEqualizer
  class TV
    include Dry::Equalizer(:manufacturer, :model)

    def initialize(manufacturer:, model:)
      @manufacturer = manufacturer
      @model = model
    end

    attr_reader :manufacturer, :model
  end
end

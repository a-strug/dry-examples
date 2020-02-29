module DryConfigurable
  class TV
    extend Dry::Configurable

    module Display
      InvalidBrightnessError = Class.new(StandardError)
    end

    module Stream
      UnknownModeError = Class.new(StandardError)
    end

    setting :display, reader: true do
      setting(:brightness, 100, reader: true) do |value|
        v = Integer(value)
        v.between?(20, 100) ? v : raise(Display::InvalidBrightnessError)
      end
    end

    setting :stream do
      setting(:mode, :cable) do |value|
        [:cable, :satellite].include?(value) ? value : raise(Stream::UnknownModeError)
      end
    end
  end
end

module DryAutoInject
  class GlobalContainer
    extend Dry::Container::Mixin

    register "build_wifi", -> { Wifi::Builder.new }
    register "build_tv", -> { Tv::Builder.new }
  end

  class Wifi
    def initialize(device)
      @device = device
    end

    class Builder
      def call(device)
        Wifi.new(device)
      end
    end
  end

  class Tv
    attr_accessor :wifi

    class Builder
      def call
        tv = Tv.new
        tv.wifi = build_wifi.(tv)
        tv
      end
    end
  end
end

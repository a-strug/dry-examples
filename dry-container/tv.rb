module DryContainer
  class GlobalContainer
    extend Dry::Container::Mixin

    namespace('tv') do
      namespace('operations') do
        register('sell') { |device| Tv::Operations::Sell.new.call(device) }
      end
    end
  end

  class Tv
    class Base
      def sell
        puts "Custom #{self.class} sell logic here"
      end
    end

    Samsung = Class.new(Base)
    Xiaomi = Class.new(Base)

    class Operations
      class Sell
        def call(device)
          device.sell
        end
      end
    end
  end
end

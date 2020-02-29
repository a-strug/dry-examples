module DryEffects
  class Shop
    include Dry::Effects::Handler.State(:counter)

    def sell(device, count: 1)
      counter, result = with_counter(0) do
        count.times.map { device.sell }
      end

      [counter, result]
    end
  end

  class Tv
    include Dry::Effects.State(:counter)

    def sell
      self.counter += 1

      :ok
    end
  end
end

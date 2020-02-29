module DryEvents
  class Shop
    include Dry::Events::Publisher[:shop_publisher]

    register_event('tvs.sold')
  end

  class TV
    class SellListener
      def on_tvs_sold(event)
        puts "EVENT: #{event.id}"
        puts "TV: #{event[:tv]}"
      end
    end
  end
end

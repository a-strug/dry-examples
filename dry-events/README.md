### dry-events
Library providing pub/sub API
```
bin/console

shop = DryEvents::Shop.new
tv_sold_event = DryEvents::TV::SellListener.new
shop.subscribe(tv_sold_event)
shop.publish('tvs.sold', tv: 'Samsung') # => EVENT: tvs.sold\nTV: Samsung
```

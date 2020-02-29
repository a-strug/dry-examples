### dry-types
A.k.a virtus
```
bin/console
DryTypes::Tv.new(model: "Samsung", price: 100_000.0) # => #<DryTypes::Tv model="Samsung" price=100000.0 description=nil>
DryTypes::Tv.new(model: "Samsung", price: 100_000)   # => Dry::Struct::Error ([DryTypes::Tv.new] 100000 (Integer) has invalid type for ...
```

Simple mixin of class methods params and options for instances
### dry-initializer
```
bin/console

DryInitializer::TV.new(:Samsung, 123, 100_000, sold: true)   # => Dry::Types::ConstraintError (123 violates constraints (type?(String, 123) failed))
DryInitializer::TV.new(:Samsung, "123", 100_000, sold: true) # => #<DryInitializer::TV:0x00007f98c0989760 @manufacturer="Samsung", @model="123", @price=100000.0, @sold=true>
```

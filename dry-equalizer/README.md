### dry-equalizer
Simple mixin that can be used to add instance variable based equality, equivalence and inspection methods to your objects
```
bin/console

tv_1 = DryEqualizer::TV.new(manufacturer: 'Samsung', model: '123')
tv_2 = DryEqualizer::TV.new(manufacturer: 'Samsung', model: '123')
tv_3 = DryEqualizer::TV.new(manufacturer: 'Samsung', model: '321')

tv_1 == tv_2            # => true
tv_1.hash == tv_2.hash  # => true
tv_1.eql?(tv_2)         # => true
tv_1.equal?(tv_2)       # => false

tv_1 == tv_3            # => false
tv_1.hash == tv_3.hash  # => false
tv_1.eql?(tv_3)         # => false
tv_1.equal?(tv_3)       # => false
```

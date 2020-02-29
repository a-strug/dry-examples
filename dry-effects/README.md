### dry-effects
Implementation of algebraic effects in Ruby. Fundamentally, any effect consists of two parts:
introduction (throwing effect) and elimination (handling effect with an effect provider).
One of the many things you can do with them is sharing state
```
bin/console

shop = DryEffects::Shop.new
shop.sell(DryEffects::Tv.new)                 # => [1, [:ok]]
shop.sell(DryEffects::Tv.new, count: 3) # => [3, [:ok, :ok, :ok]]
```

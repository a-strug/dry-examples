### dry-monads
Set of common monads for Ruby. Monads provide an elegant way of handling errors, exceptions and
chaining functions so that the code is much more understandable and has all the error handling, without all the `if`s and
`else`s

#### Maybe
The Maybe monad is used when a series of computations could return nil at any point a.k.a `&.` operator works in Ruby
```
bin/console

sell = -> device { device.maybe_sell }
device = nil

# #bind applies a block to a monadic value. If the value is Some then calls the block passing the unwrapped value as an argument.
# Returns itself if the value is None
Maybe(device).bind(sell) # => None

device = DryMonads::Tv.new # invalid tv
Maybe(device).bind(sell) # => None

device = DryMonads::Tv.new(model: "Samsung")
Maybe(device).bind(sell) # => Some("Sold #<DryMonads::Tv:0x00007fb55e0dcff8>")
Maybe(device).bind(sell).value! # => "Sold #<DryMonads::Tv:0x00007fb55e0dcff8>"

# #fmap similar to bind but works with blocks/methods that returns unwrapped values (i.e. not Maybe instances).
Maybe(device).bind(sell).fmap { |r| r.nil? } # => Some(false)
```

#### Result
A notable downside of `Maybe` is plain `None` which carries no information about where this value was produced.
`Result` solves exactly this problem by having two constructors for `Success` and `Failure` cases
```
bin/consoleo
sell = -> device { device.result_sell }
device = DryMonads::Tv.new(model: "Samsung")
Success(device).bind(sell) # => Success("Sold #<DryMonads::Tv:0x00007fc3bb245398 @model=\"Samsung\">")
Dry::Matcher::ResultMatcher.(Success(device).bind(sell)) do |m|
  m.success { |res| "Yay: #{res}" }
  m.failure { |res| "Ops: #{res}" }
end # => "Yay: Sold #<DryMonads::Tv:0x00007fc3bb245398 @model=\"Samsung\">"
```

#### Do notation
```
bin/console

class DryMonads::Tv
  include Dry::Monads::Do.for(:yield_sell)
end

device = DryMonads::Tv.new(model: "Samsung")
device.yield_sell(true)  # => Success(#<DryMonads::Tv:0x00007fe9611577d0 @model="Samsung">)
device.yield_sell(false) # => Failure([#<DryMonads::Tv:0x00007fe9611577d0 @model="Samsung">, {:params=>false}])
```

#### Try
Rescues a block from an exception. The Try monad is useful when you want to wrap some code that can raise exceptions
of certain types

#### List
Lifts a block/proc and runs it against each member of the list

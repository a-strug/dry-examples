### dry-container
As I understand dry-container philosophy, it implements Dependency Injection SOLID principle.
Instead of passing the arguments that are needed to instantiate some service,
we pass the services themselves, which implement a common interface, for example, respond to a method #sell
```
bin/console

sell_op = DryContainer::GlobalContainer.resolve('tv.operations.sell')

sell_op.call(DryContainer::Tv::Samsung.new) # => Custom DryContainer::Tv::Samsung sell logic here
sell_op.call(DryContainer::Tv::Xiaomi.new)  # => Custom DryContainer::Tv::Xiaomi sell logic here
```

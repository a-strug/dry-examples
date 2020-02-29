### dry-auto_inject
Provides low-impact dependency injection and resolution support for your classes
```
bin/console

AutoInject = Dry::AutoInject(DryAutoInject::GlobalContainer)
class DryAutoInject::Tv::Builder
  include AutoInject["build_wifi"]
end
DryAutoInject::GlobalContainer["build_tv"].() # => #<DryAutoInject::Tv:0x00007f97aac51f40 @wifi=#<DryAutoInject::Wifi:0x00007f97aac51f18 @device=#<DryAutoInject::Tv:0x00007f97aac51f40 ...>>>
```

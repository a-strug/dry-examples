### dry-configurable
```
bin/console

DryConfigurable::TV.display.brightness       # => 100
DryConfigurable::TV.display.brightness = 0
DryConfigurable::TV.display.brightness       # => TV::Display::InvalidBrightnessError
DryConfigurable::TV.display.brightness = 50
DryConfigurable::TV.display.brightness       # => 50

DryConfigurable::TV.config[:stream][:mode]               # => :cable
DryConfigurable::TV.config[:stream][:mode] = :unknown
DryConfigurable::TV.config[:stream][:mode]               # => TV::Stream::UnknownModeError
DryConfigurable::TV.config[:stream][:mode] = :satellite
DryConfigurable::TV.config[:stream][:mode]               # => :satellite
```

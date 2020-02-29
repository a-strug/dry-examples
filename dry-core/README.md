### dry-core
Toolset provides cache, class attributes, class builder, constants, deprecations, extensions
```
bin/console

DryCore::TV.new.calculate_display_size_in_centimeters(pixel_length: 1920, pixel_width: 1080) # => NoMethodError ...
DryCore::TV.load_extensions(:display_calculations) # => [:display_calculations]
DryCore::TV.new.calculate_display_size_in_centimeters(pixel_length: 1920, pixel_width: 1080)
# [WARN] DryCore::TV#calculate_display_size_in_centimeters is deprecated and will be removed in the next major version
# Please use DryCore::TV#display_in_centimeters instead.
# => {:name=>"", :length=>50.6087481216, :width=>28.467420818399997}
DryCore::TV.clear_cache # => #<Concurrent::Map:...>
```

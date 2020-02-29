### dry-transformer
Provides a mechanism to define and compose transformations, along with a number of built-in transformations
```
bin/console

DryTransformer::Tv.new.call("m" => "Samsung", "inch_diagonal" => 13.3) # => {:model=>"Samsung", :display=>{:inch_diagonal=>13.3}}
```

### dry-inflector
Provides many useful helpers
```
bin/console

inflector = Dry::Inflector.new
inflector.pluralize("tv")           # => "tvs"
inflector.singularize("tvs")        # => "tv"
inflector.classify("tv")            # => "Tv"
inflector.demodulize("TV::Samsung") # => "Samsung"

inflector.ordinalize(1)  # => "1st"
inflector.ordinalize(2)  # => "2nd"
inflector.ordinalize(3)  # => "3rd"
```

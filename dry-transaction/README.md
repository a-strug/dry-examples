### dry-transaction
Provides a simple way to define a complex business transaction that includes processing over many steps and by many different objects
```
bin/console

transaction = -> params do
  DryTransaction::Tv::Builder.new.call(params) do |m|
    m.success do |tv|
      tv
    end
    m.failure do |error|
      error
    end
  end
end

transaction.call(inch_diagonal: 55.0, pixel_width: 5000, pixel_height: 3000) # => #<DryTransaction::Tv inch_diagonal=55.0 pixel_width=5000 pixel_height=3000>
transaction.call(inch_diagonal: 55.0, pixel_width: 5000, pixel_height: nil)  # => "invalid params: {:inch_diagonal=>55.0, :pixel_width=>5000, :pixel_height=>nil}"
```

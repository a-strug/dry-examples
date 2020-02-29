### dry-validation
Provides a powerful DSL for defining schemas and validation rules
```
bin/console

DryValidation::Tv.new.(model: "Samsung").errors.any?                                                # => true
DryValidation::Tv.new.(model: "Samsung", price: 9000.0).errors.to_h                                 # => {:price=>["Must be between 10000.0 and 100000.0"]}
DryValidation::Tv.new.(model: "Samsung", price: 10000.0, customer_email: "foo").errors.to_h         # => {:customer_email=>["not a valid email format"]}
DryValidation::Tv.new.(model: "Samsung", price: 10000.0, customer_email: "foo@bar.com").errors.any? # => false
```

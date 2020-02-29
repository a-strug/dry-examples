### dry-logic
Predicate logic and rule composition
```
bin/console

model_present = Rule::Predicate.new(Predicates[:key?]).curry(:model)
price_float = Rule::Predicate.new(Predicates[:type?]).curry(Float)
has_price_float = Operations::Key.new(price_float, name: :price)
tv_rule = model_present & has_price_float
tv_rule.(model: "Samsung", price: 100_000.0).success? # => true
```

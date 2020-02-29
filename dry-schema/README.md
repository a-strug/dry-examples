### dry-schema
Validation library for data structures
```
bin/console

DrySchema::TvSchema.(price: 100_000, display: { inch_diagonal: 13.3 }).inspect
# => "#<Dry::Schema::Result{:price=>100000.0, :display=>{:inch_diagonal=>13.3}} errors={:model=>[\"is missing\"], :display=>{:pixel_width=>[\"is missing\"], :pixel_height=>[\"is missing\"]}}>"
```

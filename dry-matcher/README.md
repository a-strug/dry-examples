### dry-matcher
Pattern matching for Ruby
```
bin/console

matcher = Dry::Matcher.new(success: DryMatcher::Tv.case(true), failure: DryMatcher::Tv.case(false))
result = -> params do
  matcher.(params) do |m|
    m.success do |tv|
      puts "Sending tv to the customer: #{tv}"
    end
    m.failure do |tv|
      puts "Ops, something wrong with tv: #{tv.inspect}"
    end
  end
end

tv = DryMatcher::Tv.new
result.call([tv.valid?, tv]) # => Ops, something wrong with tv: #<DryMatcher::Tv:0x00007fc1cc07bf30>

tv.model = "Samsung"
result.call([tv.valid?, tv]) # => Sending tv to the customer: #<DryMatcher::Tv:0x00007fc1cc07bf30>
```

## 🧩 Metaprogramming Dynamic Array Methods
Dynamically define bespoke array transformations using metaprogramming. Generate methods for common filters at runtime to reduce boilerplate and tailor performance.

```ruby
module DynamicFilters
  %w[even odd prime].each do |filter|
    define_method("select_#{filter}") do
      select { |n| n.send("#{filter}?") }
    end
  end
end

class Array
  include DynamicFilters
end

# Usage
p [1,2,3,4,5].select_prime   # => [2,3,5]
```
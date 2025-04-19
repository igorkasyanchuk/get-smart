## 🔄 Iterating Over Keys and Values
You can loop through hashes with `each`, `each_key`, or `each_value`. This allows you to process or transform data in your hash easily.

```ruby
prices = { apple: 2, banana: 1, cherry: 3 }

# Full iteration
prices.each do |fruit, cost|
  puts "#{fruit.capitalize}: $#{cost}"
end

# Only keys
prices.each_key { |fruit| puts fruit }

# Only values
prices.each_value { |cost| puts cost }  
```
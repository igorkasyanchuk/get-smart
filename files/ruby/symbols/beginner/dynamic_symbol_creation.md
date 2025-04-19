## 🔄 Create Symbols Dynamically with `to_sym`
You can convert strings into symbols at runtime using `to_sym`, which is useful when mapping user input or generating keys dynamically.

```ruby
fields = %w[name age email]
user_data = {}

fields.each do |field_name|
  input = gets.chomp
  user_data[field_name.to_sym] = input
end

puts user_data  # => {:name=>"Alice", :age=>"30", :email=>"alice@example.com"}
```

This technique helps you build hashes or call methods based on external data, while still leveraging the efficiency of symbols.
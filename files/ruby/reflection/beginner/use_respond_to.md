## 🔍 Check If an Object Responds to a Method
Before calling a method dynamically, ensure the object actually implements it to avoid `NoMethodError`. Use `respond_to?` to guard your reflective calls safely.

```ruby
user = OpenStruct.new(name: "Amy")
if user.respond_to?(:name)
  puts "User name: #{user.name}"
else
  puts "Name not available"
end
```

This check prevents errors and lets you handle objects that may or may not support specific methods.
## 🛡️ Use rescue to catch exceptions
Use the `rescue` keyword to handle any runtime errors and prevent crashes. Place your code inside a `begin` block and add a `rescue` clause to catch exceptions.

```ruby
begin
  result = 10 / 0
rescue
  puts 'An error occurred'
end
```
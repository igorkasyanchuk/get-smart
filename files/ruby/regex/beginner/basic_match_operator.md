## 🔍 Using the =~ Operator
The `=~` operator lets you quickly test if a string matches a regex. It returns the index of the first match or `nil` if there’s no match, making it perfect for simple conditionals.

```ruby
text = "Hello, world!"
if text =~ /world/
  puts "Found 'world' at index #{text =~ /world/}!"
else
  puts "No match found."
end
```
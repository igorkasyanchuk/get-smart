## 📌 Using Anchors
Anchors `^` and `$` match the start and end of a string, respectively. They ensure your pattern applies to the whole string or specific positions.

```ruby
# Validate a 5-digit ZIP code
zip = "12345"
if zip =~ /^\d{5}$/  
  puts "Valid ZIP code"
else
  puts "Invalid ZIP code"
end
```
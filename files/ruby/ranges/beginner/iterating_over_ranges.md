## 🔄 Iterating Over Ranges with `each`

Ranges are Enumerable, so you can loop through them just like arrays. This is handy for simple loops without managing counters manually.

```ruby
(1..5).each do |n|
  puts "Number: #{n}"
end

# Output:
# Number: 1
# Number: 2
# ...
# Number: 5
```
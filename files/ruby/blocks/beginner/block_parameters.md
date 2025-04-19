## 📥 Capturing Block Parameters
Blocks can take multiple parameters. Simply list them between pipes (`| |`), and Ruby will assign values from the caller.

```ruby
items = [["apple", 3], ["banana", 5], ["cherry", 2]]
items.each do |fruit, count|
  puts "We have #{count} #{fruit}s."
end
# Output:
# We have 3 apples.
# We have 5 bananas.
# We have 2 cherrys.
```
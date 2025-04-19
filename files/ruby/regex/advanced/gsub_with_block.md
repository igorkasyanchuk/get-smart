## 🧩 Transform Captures with gsub and Block
Combine regex with `String#gsub` blocks to process each match dynamically. Use named captures for clarity and apply custom logic in the block for powerful in-place transformations.

```ruby
text = 'Order: #123, #456'
result = text.gsub(/#(?<id>\d+)/) do
  id = Regexp.last_match[:id].to_i
  "ORDER-#{format('%05d', id)}"
end
#=> "Order: ORDER-00123, ORDER-00456"
```
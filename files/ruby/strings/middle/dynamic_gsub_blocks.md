## 🔄 Transform Matches with gsub and Blocks
Using `String#gsub` with a block lets you apply custom logic for each match, rather than a static replacement. This is useful for conditional formatting, serializing values, or injecting computed data. The matched substring is yielded for transformation.

```ruby
text = "Price: $5, Discount: $1"
adjusted = text.gsub(/\$(\d+)/) do |match|
  amount = match.delete_prefix("$").to_i * 0.9
  format("$%.2f", amount)
end
puts adjusted
# => "Price: $4.50, Discount: $0.90"
```
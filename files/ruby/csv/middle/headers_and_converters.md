## 🔧 Leverage Headers and Converters for Typed Data

By enabling `headers: true` and providing `converters`, you get automatic type casting and easy access by column name. Ruby’s CSV supports built‑in converters like `:numeric` and `:date`, or you can define your own to massage data on the fly.

```ruby
require 'csv'

options = {
  headers: true,
  converters: [:numeric, :date]
}

CSV.foreach('orders.csv', **options) do |row|
  # row['total'] is now a Float, row['placed_on'] is a Date
  puts "Order ##{row['id']}: $#{row['total']} on #{row['placed_on']}"
end
```

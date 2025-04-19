## 🔄 Leveraging Lazy Streaming with CSV.open and Enumerator

Maximize memory efficiency by processing CSV rows lazily. Use `CSV.open` with an Enumerator to stream rows without loading the entire file. This approach lets you chain transformations with lazy enumerators and stop early if needed.

```ruby
require 'csv'

stream = CSV.open("large.csv", headers: true, col_sep: ",", encoding: "bom|utf-8").lazy

stream
  .select { |row| row["status"] == "active" }
  .map    { |row| row.to_h.transform_keys(&:downcase) }
  .take(1000)
  .each  { |row| process(row) }
```
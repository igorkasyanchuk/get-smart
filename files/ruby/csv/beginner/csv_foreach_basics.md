## 🏃 CSV.foreach Basics

CSV is part of Ruby’s standard library and makes it easy to iterate over rows. Use `CSV.foreach` to read a file line by line without loading the entire file into memory, which is ideal for large datasets.

```ruby
require 'csv'

CSV.foreach('data.csv', headers: false) do |row|
  puts row.inspect  # each row is an Array of values
end
```
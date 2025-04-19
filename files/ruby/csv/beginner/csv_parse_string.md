## 🔄 Parsing CSV from a String

Sometimes you receive CSV data as a string (e.g., from an API). Use `CSV.parse` to convert the string into rows in memory. This is quick for small datasets or on-the-fly parsing.

```ruby
require 'csv'

data = "name,age\nAlice,30\nBob,25"
rows = CSV.parse(data, headers: true)

rows.each do |row|
  puts "#{row['name']} is #{row['age']} years old"
end
```
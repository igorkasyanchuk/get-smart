## 💾 Efficiently Process Large CSV Files

When working with large CSVs, loading the entire file into memory can cause your app to crash. CSV.foreach reads the file line by line, yielding each row to a block without building a huge in-memory array. You can combine it with headers to get `CSV::Row` objects or skip headers for raw arrays.

```ruby
require 'csv'

CSV.foreach('huge_data.csv', headers: true) do |row|
  # Process each row individually
  puts "User: #{row['name']}, Age: #{row['age']}"
end
```

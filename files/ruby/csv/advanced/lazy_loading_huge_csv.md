## 🚀 Lazy Loading Huge CSV Files

When dealing with multi-GB CSVs, loading everything into memory can crash your process. You can leverage Ruby's lazy enumerators combined with CSV to process data in manageable chunks. This approach reads rows on demand and batches them for processing without loading the entire file at once.

```ruby
require 'csv'

file = File.open('huge_dataset.csv', 'r:bom|utf-8')
enumerator = CSV.new(file, headers: true).lazy

enumerator.each_slice(10_000) do |batch|
  # Process 10k rows at a time
  batch.each { |row| process_row(row) }
end
```

The `lazy` call ensures that rows are parsed only when accessed, and `each_slice` helps you work in fixed-size batches.

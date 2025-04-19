## 🛠️ Define Custom CSV Converters

The built-in converters (`:integer`, `:float`, `:date`) are handy, but you can define your own for specialized data types. Custom converters apply transformations as each field is parsed, keeping your post-processing logic clean.

```ruby
require 'csv'

CSV::Converters[:upcase_string] = lambda do |field|
  field && field.strip.upcase
end

options = {
  headers: true,
  converters: [:integer, :date, :upcase_string]
}

CSV.foreach('data.csv', **options) do |row|
  # row['NAME'] is already upcased
  puts "ID: #{row['id']}, Name: #{row['NAME']}"
end
```

By registering your lambda under `CSV::Converters`, you can reuse it across multiple CSV reads or even gemify a suite of common converters.
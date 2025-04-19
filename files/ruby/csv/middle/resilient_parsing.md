## ⚠️ Handle Malformed Rows Gracefully

Real‑world CSVs often contain missing fields, extra columns, or broken encoding. Use `liberal_parsing: true` and `skip_blanks: true` to forgive minor issues, and rescue `CSV::MalformedCSVError` to log or skip truly broken lines without halting your process.

```ruby
require 'csv'

File.open('messy.csv', 'r:bom|utf-8') do |file|
  parser = CSV.new(file, liberal_parsing: true, skip_blanks: true)
  parser.each_with_index do |row, idx|
    begin
      puts "Row #{idx}: #{row.inspect}"
    rescue CSV::MalformedCSVError => e
      warn "Skipped malformed row #{idx}: #{e.message}"
    end
  end
end
```

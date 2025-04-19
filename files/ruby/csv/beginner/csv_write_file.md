## ✍️ Writing CSV Files

Use `CSV.open` with write mode to create or overwrite a CSV file. Pass an array of values for each row, and Ruby will handle proper quoting and escaping for you.

```ruby
require 'csv'

CSV.open('output.csv', 'w') do |csv|
  csv << ['name', 'email']
  csv << ['Alice', 'alice@example.com']
  csv << ['Bob', 'bob@example.com']
end
```
## 🏷️ Accessing Columns via Headers

Enabling `headers: true` treats the first row as field names, letting you refer to columns by header instead of index. This improves readability and reduces errors when the column order changes.

```ruby
require 'csv'

CSV.foreach('users.csv', headers: true) do |row|
  puts "User: #{row['username']}, Email: #{row['email']}"
end
```
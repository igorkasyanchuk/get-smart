## 📝 Write CSV with Custom Delimiters and Header Order

When exporting data, you may need a specific column order, custom separators, or different quoting rules. CSV.open and CSV.generate let you define `col_sep`, `quote_char`, and supply your own header row before streaming records.

```ruby
require 'csv'

headers = ['id','name','email']
CSV.open('export.csv', 'w', col_sep: ';', quote_char: '"') do |csv|
  csv << headers
  User.find_each do |user|
    csv << [user.id, user.name, user.email]
  end
end
```

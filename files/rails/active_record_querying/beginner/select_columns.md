## 📊 Using `select` for Specific Columns

`select` allows you to load only certain columns into model objects instead of the full table. This reduces memory usage when dealing with large tables. Note that unused attributes will be `nil`.

```ruby
# Load only id and name
customers = Customer.select(:id, :name)

customers.each do |c|
  puts c.name
end
```
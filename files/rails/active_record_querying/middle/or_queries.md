## 🎯 Combining Queries with `.or`

Active Record's `.or` method lets you merge two relation objects into a single SQL query using `OR`. This is handy for complex boolean logic without writing raw SQL. Each scope must target the same table.

```ruby
# Customers in California or New York
ca = Customer.where(state: 'CA')
ny = Customer.where(state: 'NY')
customers = ca.or(ny)
```
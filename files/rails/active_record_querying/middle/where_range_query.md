## 🔍 Using `where` with Ranges

Rails allows you to pass Ruby ranges directly to `where`, producing `BETWEEN` queries in SQL. This syntax improves readability and conciseness when filtering by a continuous value range.

```ruby
# Fetch orders created in the last week
orders = Order.where(created_at: 7.days.ago..Time.current)
```
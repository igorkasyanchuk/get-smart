## 🚀 Using Arel for Complex Joins

Arel gives you low‑level access to the SQL AST, perfect for building dynamic, complex joins and conditions. Use it when ActiveRecord’s DSL falls short.

```ruby
users  = User.arel_table
orders = Order.arel_table
join_condition = users[:id].eq(orders[:user_id])

query = users
  .join(orders).on(join_condition)
  .project(users[Arel.star], orders[:total])
  .where(orders[:total].gt(100))

sql = query.to_sql
ActiveRecord::Base.connection.exec_query(sql)
```
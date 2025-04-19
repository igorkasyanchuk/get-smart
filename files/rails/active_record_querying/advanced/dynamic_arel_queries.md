## 🔧 Build Dynamic Queries with Arel
Arel provides a programmatic way to construct SQL expressions safely. Use Arel tables and nodes to avoid SQL injection while building complex OR/AND conditions dynamically.

```ruby
users = Arel::Table.new(:users)
query = users.project(Arel.star)
conditions = []
conditions << users[:age].gt(18) if params[:adult]
conditions << users[:status].eq('active') if params[:active]
query = query.where(conditions.inject(&:and))
result = ActiveRecord::Base.connection.exec_query(query.to_sql)
```

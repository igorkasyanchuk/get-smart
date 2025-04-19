## 📦 Craft Internal DSLs Using Blocks
Leverage blocks and `instance_eval` to create concise internal DSLs. This pattern shines in configuration or builder objects.

```ruby
class QueryBuilder
  def initialize(&block)
    @clauses = []
    instance_eval(&block)
  end

  def where(condition)
    @clauses << "WHERE #{condition}"
  end

  def order(field)
    @clauses << "ORDER BY #{field}"
  end

  def to_sql
    @clauses.join(' ')
  end
end

sql = QueryBuilder.new do
  where "age > 18"
  order "created_at DESC"
end.to_sql

puts sql  # => "WHERE age > 18 ORDER BY created_at DESC"
```
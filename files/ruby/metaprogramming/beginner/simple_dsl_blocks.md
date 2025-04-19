## 📜 Create a Simple DSL with Blocks

Blocks combined with metaprogramming let you build concise DSLs. You can yield a context object and define methods within that block to read more naturally.

```ruby
class QueryBuilder
  def initialize(&block)
    @clauses = []
    instance_eval(&block)
  end

  def select(columns)
    @clauses << "SELECT #{columns.join(', ')}"
  end

  def where(cond)
    @clauses << "WHERE #{cond}"
  end

  def to_sql
    @clauses.join(' ')
  end
end

sql = QueryBuilder.new do
  select [:name, :age]
  where "age > 21"
end

puts sql.to_sql   # => "SELECT name, age WHERE age > 21"
```
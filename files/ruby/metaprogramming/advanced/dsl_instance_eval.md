## 🚀 Internal DSL via `instance_eval`
Build internal DSLs by evaluating blocks in a custom context object. This allows you to design fluent interfaces that read like a language tailored to your problem domain.

```ruby
class QueryBuilder
  def initialize
    @clauses = []
  end

  def where(cond)
    @clauses << "WHERE #{cond}"
  end

  def to_sql
    "SELECT * FROM table #{@clauses.join(' ')}"
  end

  def self.build(&block)
    qb = new
    qb.instance_eval(&block)
    qb.to_sql
  end
end

sql = QueryBuilder.build { where "age > 21" }
```
## 🔧 Chainable DSL via Lambdas

Design a fluent interface with lambdas that build and return new scopes. This immutability-inspired pattern enables construction of complex queries or configurations without side effects.

```ruby
class Query
  def initialize(clauses = [])
    @clauses = clauses
  end

  def where(condition)
    Query.new(@clauses + ["WHERE #{condition}"])
  end

  def order_by(field)
    Query.new(@clauses + ["ORDER BY #{field}"])
  end

  def to_sql
    "SELECT * FROM table " + @clauses.join(' ')
  end
end

q = Query.new.where("age > 21").order_by("name")
puts q.to_sql  # => "SELECT * FROM table WHERE age > 21 ORDER BY name"
```
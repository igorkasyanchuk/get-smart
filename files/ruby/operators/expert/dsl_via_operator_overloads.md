## 🧨 Crafting Internal DSLs with Operator Overloading

Redefine operators like `<<`, `[]`, or `|` to construct internal DSLs. This makes definitions concise and expressive, ideal for query builders or state machines.

```ruby
class QueryBuilder
  def initialize; @parts = [] end

  def <<(clause)
    @parts << clause
    self
  end

  def |(other)
    @parts << "OR #{other}"
    self
  end

  def to_sql
    @parts.join(' ')
  end
end

q = QueryBuilder.new
       << 'SELECT * FROM users'
       << 'WHERE active = true'
       | 'role = "admin"'
puts q.to_sql
# ⇒ SELECT * FROM users WHERE active = true OR role = "admin"
```
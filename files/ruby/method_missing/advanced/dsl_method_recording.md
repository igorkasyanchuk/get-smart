## 🛠️ Build a Fluent DSL with method_missing

You can craft internal DSLs by capturing method calls, their arguments, and blocks to assemble custom behavior. Store calls in an array or build an AST, then evaluate them at once.

```ruby
class QueryBuilder
  def initialize
    @clauses = []
  end

  def method_missing(name, *args, &block)
    @clauses << { method: name, args: args }
    self
  end

  def to_sql
    @clauses.map { |c| "#{c[:method].upcase} #{c[:args].join(', ')}" }.join(' ')
  end

  def respond_to_missing?(name, include_private = false)
    true
  end
end

qb = QueryBuilder.new
sql = qb.select('*').from('users').where('age > 18').to_sql
# => "SELECT *, FROM users WHERE age > 18"
```
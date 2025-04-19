## ✨ Fluent Interface with Method Chaining

Build chainable methods by returning `self` so calls can be chained fluently. Use metaprogramming to generate these proxies for bulk operations.

```ruby
class QueryBuilder
  def initialize
    @clauses = []
  end

  %i[select where order limit].each do |method|
    define_method(method) do |arg|
      @clauses << "#{method.upcase} #{arg}"
      self
    end
  end

  def to_sql
    @clauses.join(' ')
  end
end

qb = QueryBuilder.new
sql = qb.select('*').where('age > 30').order('name').to_sql
puts sql  # => "SELECT * WHERE age > 30 ORDER name"
```
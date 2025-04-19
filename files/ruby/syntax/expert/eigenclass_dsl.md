## 🔥 Eigenclass DSL Patterns with `class << self`

Elevate your DSLs by defining class‑level methods directly in the eigenclass. Combine with `method_missing` or `respond_to_missing?` for a fluid interface that feels native to the domain.

```ruby
class QueryBuilder
  class << self
    def select(*fields)
      @fields = fields
      self
    end

    def from(table)
      @table = table
      self
    end

    def to_sql
      "SELECT #{[@fields.join(', ')]} FROM #{@table};"
    end
  end
end

puts QueryBuilder.select(:id, :name).from(:users).to_sql
# => "SELECT id, name FROM users;"
```
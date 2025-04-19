## 📊 Safe Dynamic Queries with Arel
When building highly dynamic queries (e.g., multi-column search, dynamic filters), Arel lets you assemble SQL fragments without injection risk. It also plays nicely with ActiveRecord and your database adapter.

```ruby
# dynamic filter params: { field: 'email', operator: 'matches', value: '%@example.com' }
def dynamic_scope(params)
  table = Arel::Table.new(:users)
  predicate = case params[:operator]
              when 'eq'     then table[params[:field]].eq(params[:value])
              when 'matches' then table[params[:field]].matches(params[:value])
              end
  User.where(predicate.to_sql)
end
```

This approach builds queries from typed Arel objects instead of interpolating strings, fully mitigating SQL injection.

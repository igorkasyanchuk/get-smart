## 🔍 Implement Full-Text Search Predicate with Postgres

Leverage Postgres full-text search to deliver fast, ranked results directly through Ransack by defining a custom `:fts` predicate. This approach uses Postgres’ `to_tsvector` and `plainto_tsquery` functions under the hood, allowing you to search across multiple columns efficiently.

```ruby
# config/initializers/ransack.rb
Ransack.configure do |config|
  config.add_predicate name: :fts,
                        arel_predicate: :matches,
                        formatter: proc { |v|
                          Arel.sql(
                            "to_tsvector('english', users.title || ' ' || users.body) @@ plainto_tsquery('english', #{ActiveRecord::Base.connection.quote(v)})"
                          )
                        },
                        validator: proc { |v| v.present? },
                        type: :string
end
```

Now you can run:

```ruby
Article.ransack(fts: 'full text search').result
```
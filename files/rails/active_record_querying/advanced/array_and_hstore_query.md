## 📑 Query Postgres Arrays and HSTORE
Postgres arrays and HSTORE columns are queryable via specialized operators. Use `@>`, `ANY`, or `?` operators in `where` clauses to filter records containing specific array elements or key/value pairs.

```ruby
# Find posts tagged with 'rails'
Post.where("tags @> ARRAY[?]::varchar[]", ['rails'])
# Find settings where key 'theme' exists in hstore
User.where("preferences ? ?", 'theme')
```

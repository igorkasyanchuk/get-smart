## 🏷️ Optimize SQL Indexes

Adding or tweaking indexes can drastically speed up queries on large tables. Analyze slow queries and add indexes on frequently filtered or joined columns.

```ruby
# migration to add index
generate migration AddIndexToUsersEmail
# in the generated migration
def change
  add_index :users, :email
end
```

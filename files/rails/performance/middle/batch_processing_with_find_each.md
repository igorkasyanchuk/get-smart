## 📦 Batch Processing with `find_each`

Process large datasets in batches to avoid memory bloat. `find_each` retrieves records in batches and yields them one by one.

```ruby
# Process 1,000 users at a time without loading all at once
User.where(needs_reindex: true).find_each(batch_size: 1000) do |user|
  user.reindex_profile
end
```

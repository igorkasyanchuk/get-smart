## 🔄 Process Records in Batches with `find_each`

When you need to handle large datasets without exhausting memory, use `find_each`. It retrieves records in batches (default 1000), yielding one record at a time.

```ruby
User.where(active: true).find_each(batch_size: 500) do |user|
  user.send_newsletter!
end
```
## 🗃️ Optimistic Locking with Conditional Updates
Rails’ built-in optimistic locking can be combined with targeted `update_all` calls to avoid race conditions on high-traffic records. Check the `lock_version` within a `where` clause to ensure atomic version bumps and detect conflicts.

```ruby
def safe_increment_counter(post_id)
  Post.where(id: post_id)
      .where("lock_version = ?", Post.find(post_id).lock_version)
      .update_all("counter = counter + 1, lock_version = lock_version + 1")
end
``` 

This manual approach reduces the window for stale reads and keeps lock contention minimal for hot rows.
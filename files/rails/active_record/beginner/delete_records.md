## ❌ Delete Records with `destroy` and `delete`

Active Record offers `destroy` to run callbacks and `delete` to remove records directly. Use `destroy` when you need associated cleanup or validations; `delete` is faster when you just want to remove rows.

```ruby
# Runs callbacks and removes record
post = Post.find(5)
post.destroy

# Deletes directly (no callbacks)
Comment.where(post_id: 5).delete_all
```  

## 🗑️ Deleting and Purging Attachments

Remove attachments with `purge` to delete files from storage and database. Use `purge_later` for background cleanup if you have Active Job configured.

```ruby
# In controller or console
@user = User.find(params[:id])

# Immediately delete attachment
action = @user.avatar.purge

# Or enqueue deletion for later
@user.documents.purge_later
```
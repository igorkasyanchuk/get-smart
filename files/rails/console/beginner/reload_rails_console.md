## 🔄 Reload Code Instantly

When you’re experimenting in the console and make changes to your models or other classes, you don’t need to exit and reopen the console. The `reload!` command reloads your application code on the fly so you can pick up the latest edits.

```ruby
# Start the console
$ rails console

# Edit app/models/user.rb in your editor, then back in the console:
> reload!
=> true

# Now your updated User model behavior is available immediately.
```
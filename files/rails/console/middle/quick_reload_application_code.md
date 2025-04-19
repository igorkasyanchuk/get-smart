## ⏮️ Quick Reload of Application Code

When working in the Rails console, you often need to pick up code changes without restarting the session. The `reload!` command reloads your application classes and modules, reflecting any edits you’ve made. It's especially handy when iterating on models or service objects.

```ruby
# After editing app/models/user.rb or any other file
reload!

# Now the console picks up the new methods or validations
User.new.custom_method
```

If you’ve added new files (e.g., new models or concerns), you may need to eager load them first:

```ruby
Rails.application.eager_load!
reload!
```
## 📋 Check Your Current Rails Version

Before making any changes, it’s helpful to know which Rails version your app is using. You can check it from the command line or within your code.

```bash
# In your terminal
rails -v
# Example output: Rails 6.1.4
```

Alternatively, inside a Rails console or initializer you can use:

```ruby
# Rails console or application code
def current_rails_version
  Rails.version
end

puts current_rails_version # => "6.1.4"
```

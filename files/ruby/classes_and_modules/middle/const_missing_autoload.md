## 🔍 Lazy Loading with `const_missing` and Autoload

Implement `const_missing` or use `autoload` to load modules or classes only when referenced. This approach reduces memory footprint and speeds up startup times in large applications.

```ruby
module MyApp
  autoload :User, 'my_app/user'
  autoload :Order, 'my_app/order'
end

# Or custom const_missing
def MyApp.const_missing(name)
  require "my_app/#{name.to_s.downcase}"
  const_get(name)
end
```
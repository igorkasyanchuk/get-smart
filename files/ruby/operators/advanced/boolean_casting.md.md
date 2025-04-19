## ✅ Double Bang for Strict Boolean Casting

The double bang operator (`!!`) converts any object to its boolean equivalent (`true` or `false`). It’s handy in conditional contexts or when you need explicit boolean values instead of truthy/falsy objects.

```ruby
def feature_enabled?(config)
  !!config[:enable_feature]
end

p feature_enabled?(enable_feature: "yes") # => true
p feature_enabled?(enable_feature: nil)   # => false
```
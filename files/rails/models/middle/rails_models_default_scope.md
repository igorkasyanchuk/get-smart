## 🛑 Be Cautious with Default Scopes

Default scopes apply to every query on a model, which can lead to surprising behaviors or N+1 queries if not managed carefully. Use them sparingly for truly global filters. If you need to bypass a default scope, use `unscoped` in your query.

```ruby
class User < ApplicationRecord
  default_scope { where(active: true) }
end

# Bypass default scope:
User.unscoped.where(admin: true)
```
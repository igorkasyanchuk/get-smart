## ⚠️ Use `default_scope` cautiously to avoid unexpected query side effects

While `default_scope` applies default conditions, it can cause confusion:

```ruby
class Article < ApplicationRecord
  default_scope { where(published: true) }
end
```

This scope applies everywhere, making it hard to query unpublished articles unless you use `unscoped`:

```ruby
Article.unscoped.where(published: false)
```

Prefer explicit scopes when possible.
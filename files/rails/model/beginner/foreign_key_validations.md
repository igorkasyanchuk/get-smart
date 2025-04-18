## 🔗 Enforce foreign key presence with `belongs_to` optional setting

Rails 5+ makes `belongs_to` required by default. To ensure associated records exist:

```ruby
class Comment < ApplicationRecord
  belongs_to :post # post_id must be present and valid
end
```

If it's optional:

```ruby
class Comment < ApplicationRecord
  belongs_to :post, optional: true
end
```

Always set presence validation explicitly if needed for data integrity.
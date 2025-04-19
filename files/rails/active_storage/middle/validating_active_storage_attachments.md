## 🛡️ Validate Attachments in Models
Use built-in Active Storage validators to ensure files meet your requirements before saving. You can validate content types and file sizes directly in your model to prevent unwanted uploads and improve security.

```ruby
class User < ApplicationRecord
  has_one_attached :avatar

  validates :avatar,
            attached: true,
            content_type: ['image/png', 'image/jpg', 'image/jpeg'],
            size: { less_than: 5.megabytes, message: 'should be under 5MB' }
end
```

This ensures only images of allowed types and sizes are accepted. If validation fails, errors will be added to `avatar` for easy display in views.

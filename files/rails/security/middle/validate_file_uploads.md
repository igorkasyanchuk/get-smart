## 📂 Validate and Sanitize File Uploads
When handling file uploads, validate file types and sizes to prevent malicious files.

Using Active Storage:

```ruby
class User < ApplicationRecord
  has_one_attached :avatar

  validate :acceptable_avatar

  def acceptable_avatar
    return unless avatar.attached?

    unless avatar.byte_size <= 1.megabyte
      errors.add(:avatar, "is too big")
    end

    acceptable_types = ["image/jpeg", "image/png"]
    unless acceptable_types.include?(avatar.content_type)
      errors.add(:avatar, "must be a JPEG or PNG")
    end
  end
end
```

This ensures only allowed file types and sizes are processed.
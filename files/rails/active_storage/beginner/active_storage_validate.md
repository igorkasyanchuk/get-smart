## ✅ Validating Attachments

Ensure file types and sizes meet your requirements by adding validations. Using the `content_type` and `size` options prevents unwanted uploads.

```ruby
# app/models/user.rb
class User < ApplicationRecord
  has_one_attached :avatar

  validate :avatar_validation

  private

  def avatar_validation
    return unless avatar.attached?
    unless avatar.content_type.in?(%w[image/png image/jpeg])
      errors.add(:avatar, "must be a PNG or JPG")
    end
    if avatar.byte_size > 1.megabyte
      errors.add(:avatar, "size must be less than 1MB")
    end
  end
end
```
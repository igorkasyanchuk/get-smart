## 📂 Validate File Uploads

Ensure uploaded files meet type and size constraints to avoid malicious uploads. Use Active Storage validations or custom checks.

```ruby
# app/models/avatar.rb
class Avatar < ApplicationRecord
  has_one_attached :image

  validate :correct_image_type

  private

  def correct_image_type
    if image.attached? && !image.content_type.in?(%w[image/png image/jpg image/jpeg])
      errors.add(:image, 'Must be a PNG or JPG')
    end
  end
end
```

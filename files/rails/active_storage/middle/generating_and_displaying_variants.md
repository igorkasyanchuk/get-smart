## 📐 Create and Display Image Variants
Active Storage can generate resized or cropped variants on the fly for responsive images. This helps you serve appropriately sized images without storing duplicates.

```ruby
# app/models/photo.rb
class Photo < ApplicationRecord
  has_one_attached :image

  def thumb
    image.variant(resize_to_limit: [200, 200]).processed
  end
end
```

```erb
<%= image_tag @photo.thumb, alt: "Thumbnail" %>
```

Call `.processed` to force immediate processing (useful in tests or background jobs). Variants are cached, so subsequent requests are fast.
## 🖼️ Resize and Convert Image Variants

ActiveStorage’s variants leverage the image_processing gem under the hood to resize, crop, and convert formats on-the-fly. Defining a variant in your model keeps view code clean and DRY. Here’s how to generate a JPEG thumbnail with quality settings:

```ruby
# app/models/photo.rb
class Photo < ApplicationRecord
  has_one_attached :image

  def thumbnail
    image.variant(
      resize_to_limit: [150, 150],
      format: :jpeg,
      saver: { quality: 80 }
    )
  end
end
```

Then render in your view:

```erb
<%= image_tag @photo.thumbnail, alt: "Photo thumbnail" %>
```

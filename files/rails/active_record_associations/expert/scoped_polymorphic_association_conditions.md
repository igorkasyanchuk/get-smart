## 📚 Scoped Polymorphic Association with Conditions

Advanced use cases often require scoping polymorphic associations by type and custom conditions. You can leverage lambda scopes to filter specific subclasses and add SQL constraints in one association declaration.

```ruby
class Attachment < ApplicationRecord
  belongs_to :attachable, polymorphic: true

  scope :images, -> { where(content_type: ['image/png', 'image/jpeg']) }
end

class Product < ApplicationRecord
  has_many :attachments, as: :attachable
  has_many :image_attachments, -> { images }, as: :attachable, class_name: 'Attachment'
end
```

## 🧩 Leveraging Polymorphic Associations for Flexible Relations

Polymorphic associations let a model belong to more than one other model on a single association. This is useful for shared features like comments, attachments, or tags across various resources. Define a `belongs_to :attachable, polymorphic: true` on the polymorphic model and use `has_many :comments, as: :commentable` on each parent.

```ruby
class Comment < ApplicationRecord
  belongs_to :commentable, polymorphic: true
end

class Article < ApplicationRecord
  has_many :comments, as: :commentable, dependent: :destroy
end

class Photo < ApplicationRecord
  has_many :comments, as: :commentable, dependent: :destroy
end
```

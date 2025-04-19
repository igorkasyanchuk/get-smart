## 🌀 Implement Polymorphic Associations

Polymorphic associations let a model belong to multiple other models using a single interface. This is perfect for comments, tags, or attachments that need to relate to various resources. Ensure you include both `_id` and `_type` columns in the polymorphic model’s table.

```ruby
# migration:
create_table :notes do |t|
  t.text :body
  t.references :notable, polymorphic: true, index: true
  t.timestamps
end

# models:
class Note < ApplicationRecord
  belongs_to :notable, polymorphic: true
end

class User < ApplicationRecord
  has_many :notes, as: :notable
end

class Project < ApplicationRecord
  has_many :notes, as: :notable
end
```
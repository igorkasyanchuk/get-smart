## ⚙️ Implement Composite Primary Keys
Rails doesn’t support composite primary keys out of the box, but you can include the `composite_primary_keys` gem and configure your model to use multiple columns as a key. This is critical when you have legacy tables or join tables without single `id` columns.

```ruby
# Gemfile
gem 'composite_primary_keys'

# app/models/enrollment.rb
class Enrollment < ApplicationRecord
  self.primary_keys = :student_id, :course_id
  belongs_to :student
  belongs_to :course
end
```

With `self.primary_keys`, ActiveRecord operations (`find`, `update`, `destroy`) will correctly handle the composite key for your high‑volume lookup tables.
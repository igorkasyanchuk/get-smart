## 🔄 Composite Primary Key Association Integration

When dealing with legacy schemas featuring composite primary keys, use the `composite_primary_keys` gem to maintain Rails conventions. This allows you to define associations with composite keys seamlessly.

```ruby
# Gemfile
gem 'composite_primary_keys'

class Enrollment < ApplicationRecord
  self.primary_keys = :student_id, :course_id
  belongs_to :student, class_name: 'User', foreign_key: :student_id
  belongs_to :course, foreign_key: :course_id
end

class User < ApplicationRecord
  has_many :enrollments, foreign_key: :student_id
  has_many :courses, through: :enrollments
end
```

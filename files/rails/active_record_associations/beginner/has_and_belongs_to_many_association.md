## 🔄 Use `has_and_belongs_to_many` for Simple Many-to-Many

For a straightforward join table without a model, `has_and_belongs_to_many` connects two models directly. Ensure the join table exists with matching naming.

```ruby
# app/models/student.rb
class Student < ApplicationRecord
  has_and_belongs_to_many :courses
end

# app/models/course.rb
class Course < ApplicationRecord
  has_and_belongs_to_many :students
end
```

With a `courses_students` join table, you can call `student.courses << course` or `course.students` to traverse the association.

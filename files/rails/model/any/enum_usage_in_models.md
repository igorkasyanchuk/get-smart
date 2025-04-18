## 🔢 Use ActiveRecord enums for status and state fields

Enums are a clean way to manage state or categories:

```ruby
class Task < ApplicationRecord
  enum status: { pending: 0, in_progress: 1, completed: 2 }
end
```

Use it easily:

```ruby
task = Task.new
task.status = :pending
task.in_progress!   # changes status to 'in_progress'
puts task.completed? # => false
```

This improves readability and queryability.
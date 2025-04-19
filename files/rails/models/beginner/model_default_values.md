## 🎯 Setting Default Values

You can assign default attribute values in your models using callbacks or database defaults. This ensures new records have sensible defaults.

```ruby
class Task < ApplicationRecord
  after_initialize :set_defaults, if: :new_record?

  private

  def set_defaults
    self.status ||= 'todo'
    self.priority ||= 'normal'
  end
end
```

Alternatively, set database defaults in a migration for better performance:

```ruby
class AddDefaultsToTasks < ActiveRecord::Migration[6.1]
  def change
    change_column_default :tasks, :status, 'todo'
    change_column_default :tasks, :priority, 'normal'
  end
end
```
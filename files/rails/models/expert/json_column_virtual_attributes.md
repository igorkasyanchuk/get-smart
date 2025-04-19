## 🚀 Map JSON Columns to Virtual Attributes
When storing flexible config or metadata in a `jsonb` column, expose keys as virtual attributes for type casting and validation. Use the `attribute` API to define typed getters/setters seamlessly.

```ruby
class User < ApplicationRecord
  # settings is a jsonb column
  attribute :settings, :jsonb, default: {}
  attribute :notify_by_email, :boolean, default: -> { settings['notify_by_email'] }

  def notify_by_email=(val)
    settings['notify_by_email'] = ActiveModel::Type::Boolean.new.cast(val)
  end
end
```

This pattern keeps your model’s interface clean while leveraging Postgres JSON querying under the hood.
## 🛠️ Generate Dynamic Scopes with Metaprogramming
For models that require dozens of similar scopes (e.g., filter by status codes), dynamically define scopes using `define_singleton_method` or `class_eval`. This reduces boilerplate and keeps your model DRY.

```ruby
class Ticket < ApplicationRecord
  STATUSES = %w[pending approved rejected]

  STATUSES.each do |status|
    define_singleton_method("with_#{status}") do
      where(status: status)
    end
  end
end

# Usage:
Ticket.with_pending
Ticket.with_approved
```

Adjust to add additional options or metadata per-status by iterating a hash instead of an array.
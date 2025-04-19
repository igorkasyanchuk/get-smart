## 🔢 Length Validation

Control the minimum and maximum length of attributes with the `length` option. This prevents overly short or long strings, improving data consistency and user feedback. Specify a `minimum`, `maximum`, or both in your model.

```ruby
class Profile < ApplicationRecord
  validates :username, length: { minimum: 3, maximum: 20 }
end
```

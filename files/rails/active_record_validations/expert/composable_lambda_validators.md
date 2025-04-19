## 🤝 Composable Lambda-based Validations
Compose small lambda validators to share snippets of logic across models. This is particularly useful for micro-validations that don’t justify full classes but are too complex for inline blocks.

```ruby
# config/initializers/validators.rb
EmailCheck = ->(record, attribute) do
  unless record.send(attribute) =~ /\A[^@\s]+@[^@\s]+\z/
    record.errors.add(attribute, 'is invalid')
  end
end
UniqueNameCheck = ->(record, attribute) do
  if record.class.where(name: record.name).where.not(id: record.id).exists?
    record.errors.add(attribute, 'has already been taken')
  end
end

# app/models/vendor.rb
class Vendor < ApplicationRecord
  validate EmailCheck, on: :create
  validate UniqueNameCheck, on: :update
end
```
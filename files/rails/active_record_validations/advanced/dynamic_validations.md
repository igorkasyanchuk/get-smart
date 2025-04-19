## ⚙️ Dynamically Defining Validations at Runtime

Use meta-programming to define validations based on external configuration or database-driven rules. This is powerful for multi-tenant or highly customizable apps.

```ruby
class FeatureFlagRule < ApplicationRecord
  # columns: field_name, rule_type, options (JSON)
end

class DynamicModel < ApplicationRecord
  FeatureFlagRule.all.each do |rule|
    validates rule.field_name.to_sym, rule.rule_type.to_sym => JSON.parse(rule.options)
  end
end
```

## 📜 Validating Serialized JSON with a JSON Schema

For models that serialize JSON blobs, integrate a JSON Schema validator (e.g., `json-schema` gem) in a custom validation to enforce structure and types.

```ruby
# Gemfile
gem 'json-schema'

# app/models/service_config.rb
class ServiceConfig < ApplicationRecord
  serialize :settings, JSON
  validate :settings_must_match_schema

  def settings_must_match_schema
    schema = Rails.root.join('config', 'schemas', 'service_config.json').read
    JSON::Validator.fully_validate(JSON.parse(schema), settings).each do |error|
      errors.add(:settings, error)
    end
  end
end
```
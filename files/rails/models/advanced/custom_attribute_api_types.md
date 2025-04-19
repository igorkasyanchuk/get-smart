## 💾 Creating Virtual Attributes with the Attribute API

Define custom attribute types for serialization, coercion, and deserialization using the `attribute` API. This is ideal for JSON blobs, encrypted values, or domain-specific types.

```ruby
# lib/types/utc_datetime.rb
class Types::UtcDateTime < ActiveRecord::Type::DateTime
  def serialize(value)
    super(value&.utc)
  end
end

# app/models/event.rb
class Event < ApplicationRecord
  attribute :start_time, Types::UtcDateTime.new
  attribute :metadata, :json, default: {}
end

# Usage
e = Event.new(start_time: '2024-01-01T12:00:00+02:00')
e.start_time # => 2024-01-01 10:00:00 UTC
```
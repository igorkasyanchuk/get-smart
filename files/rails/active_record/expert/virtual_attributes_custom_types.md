## 🧩 Virtual Attributes with Custom Types
Create custom ActiveModel::Type classes to handle complex JSON structures or encryption transparently. This approach centralizes serialization logic.

```ruby
class JsonbType < ActiveModel::Type::Value
  def cast(value)
    case value
    when String then JSON.parse(value)
    else value
    end
  end

  def serialize(value)
    value.to_json
  end
end

# In model
event_store :metadata, JsonbType.new
```
## ❄️ Deep Freeze Constants to Enforce Immutability

Top‐level constants can still refer to mutable structures. To guarantee true immutability, apply a deep freeze that traverses nested arrays and hashes, preventing accidental modifications at any level. This pattern is essential for configuration objects, ensuring your constants remain pristine once initialized.

```ruby
module AppConfig
  SETTINGS = {
    timeout: 30,
    endpoints: {
      users: '/users',
      orders: '/orders'
    }
  }

  def self.deep_freeze(obj)
    case obj
    when Hash
      obj.each_value { |v| deep_freeze(v) }
    when Array
      obj.each { |v| deep_freeze(v) }
    end
    obj.freeze
  end

  deep_freeze(SETTINGS)
end

# Attempting to modify SETTINGS now raises a RuntimeError
```
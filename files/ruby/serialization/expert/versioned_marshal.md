## 📦 Customizing Marshal for Versioned Object Serialization

When your application objects evolve over time, you need a robust way to maintain backward and forward compatibility. Override `#_dump` to prepend a version tag and `::load` to dispatch on that version, allowing you to gracefully migrate old data. This pattern ensures you can read legacy dumps and upgrade them on the fly.

```ruby
class UserProfile
  attr_accessor :name, :email, :preferences

  def initialize(name, email, preferences = {})
    @name = name
    @email = email
    @preferences = preferences
  end

  # Called by Marshal.dump(obj, depth)
  def _dump(level)
    version = 2
    payload = [name, email, preferences].to_yaml
    [version, payload].pack("nA*")
  end

  # Called by Marshal.load
  def self._load(data)
    version, payload = data.unpack("nA*")
    case version
    when 1
      name, email = YAML.load(payload)
      prefs = {}
    when 2
      name, email, prefs = YAML.load(payload)
    else
      raise "Unknown version: #{version}"
    end

    new(name, email, prefs)
  end
end

# Usage
dumped = Marshal.dump(UserProfile.new("Alice", "a@example.com", theme: :dark))
restored = Marshal.load(dumped)
```
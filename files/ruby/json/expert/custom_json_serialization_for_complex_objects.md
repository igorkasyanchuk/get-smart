## 🔧 Custom JSON Serialization for Complex Ruby Objects

When serializing domain models or value objects, override `as_json` and `to_json` methods to control output, handle circular references, and inject metadata. Combine with JSON gem’s `JSON.create_id` for full object restoration:

```ruby
require 'json'

class User
  attr_accessor :id, :name, :profile

  def initialize(id, name, profile)
    @id = id
    @name = name
    @profile = profile
  end

  # embed the class name for recreation
  def as_json(*)
    {
      JSON.create_id => self.class.name,
      'id' => @id,
      'name' => @name,
      'profile' => @profile.as_json
    }
  end

  def to_json(*args)
    as_json.to_json(*args)
  end
end

class Profile
  attr_accessor :bio, :avatar_url

  def as_json(*)
    { 'bio' => @bio, 'avatar_url' => @avatar_url }
  end
end

# Register classes for JSON.load
JSON.add_create_id(User)
JSON.add_create_id(Profile)

# Serialize
user = User.new(1, 'Alice', Profile.new('Dev', '/pics/alice.png'))
json_str = JSON.generate(user)

# Deserialize with object restoration
restored = JSON.load(json_str)
p restored.inspect
``` 

This approach ensures round‑trip fidelity, supports polymorphism, and can be extended with metadata, versioning fields, or encryption hooks at serialization time.
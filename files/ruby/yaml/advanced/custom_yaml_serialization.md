## 🧩 Custom Object Serialization with Psych Tags

Psych lets you define custom YAML tags and hook into `encode_with` and `init_with` to control exactly how your objects are dumped and loaded. This is invaluable when you need to preserve object identity, custom metadata, or integrate with other systems expecting specific YAML structures.

```ruby
require 'yaml'

class Person
  attr_accessor :name, :age

  # Called when dumping to YAML
  def encode_with(coder)
    coder.tag = '!person'
    coder['name'] = name
    coder['age']  = age
  end

  # Called when loading from YAML
  def init_with(coder)
    @name = coder['name']
    @age  = coder['age']
  end
end

person = Person.new
person.name = 'Alice'
person.age  = 30

# Dump with custom tag
yaml = person.to_yaml
puts yaml
# => --- !person
#    name: Alice
#    age: 30

# Load back into Person
loaded = YAML.load(yaml)
puts loaded.class  # => Person
puts loaded.name   # => "Alice"
```
## 🛠️ Customize YAML Serialization for Ruby Objects

To control how your custom classes serialize to YAML, implement `to_yaml_properties` or define Psych hooks (`encode_with` and `init_with`). This enables you to include only essential instance variables or transform data on dump and load, making your YAML outputs concise and stable across versions.

```ruby
require 'yaml'

class Person
  attr_accessor :name, :age, :password

  def initialize(name, age, password)
    @name, @age, @password = name, age, password
  end

  # Only serialize @name and @age
  def to_yaml_properties
    %w{@name @age}
  end
end

person = Person.new("Alice", 30, "secret")
puts person.to_yaml
#-- !ruby/object:Person
#name: Alice
#age: 30
```
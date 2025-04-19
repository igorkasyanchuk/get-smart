## 🔗 Dynamic Delegation with Forwardable

The `Forwardable` module lets you delegate methods to an internal object. Combine it with metaprogramming to create delegators based on configuration.

```ruby
require 'forwardable'

class Presenter
  extend Forwardable

  def initialize(record)
    @record = record
    define_delegators :@record, *record_class_fields
  end

  def record_class_fields
    @record.class.attribute_names.map(&:to_sym)
  end
end

# Assuming ActiveRecord model User with attributes :name, :email
presenter = Presenter.new(User.new(name: 'Bob', email: 'b@example.com'))
puts presenter.name  # => "Bob"
```
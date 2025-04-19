## 🛠️ Dynamic Delegation via Forwardable
Use the `Forwardable` module to route method calls to encapsulated objects, while retaining the ability to override individual delegations. This pattern streamlines API design and separation of concerns.

```ruby
require 'forwardable'

class Decorator
  extend Forwardable
  def_delegators :@obj, :name, :value

  def initialize(obj)
    @obj = obj
  end

  # Override one delegation for custom behavior
  def value
    "Decorated #{ @obj.value }"
  end
end

class Data; attr_reader :name, :value; end

data = Data.new
decorator = Decorator.new(data)
puts decorator.name   # => nil (Data#name)
puts decorator.value  # => "Decorated "
```

```ruby
# Fallback dynamic delegation via method_missing
class SmartDelegator
  def initialize(obj)
    @obj = obj
  end

  def method_missing(m, *args, &blk)
    return @obj.public_send(m, *args, &blk) if @obj.respond_to?(m)
    super
  end
end
```
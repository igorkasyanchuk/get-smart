## ✨ Eigenclass and define_singleton_method for Class Methods

Manipulate an object’s eigenclass directly to define or override class-level behavior. This technique lets you inject methods onto single instances or classes without polluting global ancestors.

```ruby
class Service
end

# Define a one-off method on Service
Service.define_singleton_method(:maintain) do
  "Maintenance mode activated"
end

puts Service.maintain  # => "Maintenance mode activated"

# For an individual object
obj = Service.new
def obj.status
  "OK"
end
puts obj.status        # => "OK"
```
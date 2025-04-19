## 📦 Dynamic Constant Lookup and Instantiation
Ruby’s `const_get`, `const_defined?`, and `const_set` let you reference or create constants by name at runtime. This is useful for plugin systems, dynamic class loading, or namespaced configurations. Always verify existence with `const_defined?` to avoid `NameError`.

```ruby
module Vehicles; class Car; end; end

def build_vehicle(type)
  namespace = Vehicles
  if namespace.const_defined?(type)
    klass = namespace.const_get(type)
    return klass.new
  else
    raise "Unknown vehicle #{type}"
  end
end

car = build_vehicle("Car")  #=> #<Vehicles::Car:0x0000...>
```
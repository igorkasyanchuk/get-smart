## 🏗️ Secure STI with an Abstract Base Class
When using Single Table Inheritance (STI), declare your parent class as abstract to prevent instantiation and migrations confusion. It also allows you to share methods without polluting the child models unnecessarily.

```ruby
class Vehicle < ApplicationRecord
  self.abstract_class = true
  # shared logic
  def start_engine
    # implementation
  end
end

class Car < Vehicle; end
class Truck < Vehicle; end
```

Migrations apply only once on `vehicles` table, and you avoid accidental `Vehicle.create` calls that can’t be loaded into a concrete subclass.
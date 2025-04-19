## 🔗 Delegation with the `Forwardable` Module

`Forwardable` lets you delegate selected methods to an internal object cleanly, avoiding boilerplate forwarding methods.

```ruby
require 'forwardable'

module Trackable
  extend Forwardable
  def_delegators :@delegatee, :start, :stop

  def initialize(delegatee)
    @delegatee = delegatee
  end
end

class Engine
  def start; puts "Engine started" end
  def stop;  puts "Engine stopped"  end
end

class Vehicle
  include Trackable
end

Vehicle.new(Engine.new).start # => "Engine started"
```

Use `def_delegators` for multiple methods or `def_delegator` for single ones.
## 🚀 Generating Delegators Dynamically

You can DRY delegation by looping over methods and calling `def_delegator` or `def_delegators` at runtime.

```ruby
require 'forwardable'

class Proxy
  extend Forwardable
  METHODS = %i[foo bar baz]

  def initialize(target)
    @target = target
  end

  METHODS.each do |meth|
    def_delegator :@target, meth
  end
end

class Worker
  def foo; 'foo'; end
  def bar; 'bar'; end
  def baz; 'baz'; end
end

proxy = Proxy.new(Worker.new)
proxy.bar # => 'bar'
```

This pattern keeps delegators in sync with your target’s API.
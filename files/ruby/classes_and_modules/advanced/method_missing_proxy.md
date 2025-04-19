## 🕵️ Proxy Pattern via `method_missing` in a Module

Implement a transparent proxy by including a module that forwards unknown messages to a target object using `method_missing`.

```ruby
module Proxyable
  def initialize(target)
    @__target = target
  end

  def method_missing(m, *args, &blk)
    if @__target.respond_to?(m)
      @__target.public_send(m, *args, &blk)
    else
      super
    end
  end

  def respond_to_missing?(m, include_private=false)
    @__target.respond_to?(m, include_private) || super
  end
end

class LoggerProxy
  include Proxyable
end

proxy = LoggerProxy.new(Logger.new(STDOUT))
proxy.info("hello") # forwarded to Logger#info
```

This mixin enforces a clean separation between proxy and proxied object.
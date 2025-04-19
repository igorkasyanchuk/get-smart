## 🔄 Forwarding Arguments with Ruby 2.7+
Ruby 2.7+ introduced argument forwarding (`...`), letting you delegate all positional, keyword, and block arguments transparently. This avoids tedious splat (`*args`) and double-splat (`**kwargs`) boilerplate and ensures future compatibility when you add new params.

```ruby
module Audit
  def process(...)
    puts "[Audit] Calling: #{__method__} with #{...}"
    super(...)
  end
end

class Service
  prepend Audit
  def process(user, action:, **opts)
    # complex logic here
  end
end

Service.new.process("bob", action: :login, ip: "127.0.0.1")
```
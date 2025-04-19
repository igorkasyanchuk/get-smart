## 📐 Transparent Delegation with `Forwardable` in Modules
Use `Forwardable` or `SingleForwardable` to define delegate methods cleanly, avoiding `method_missing` overhead. This yields explicit, performant delegation inside modules or classes.

```ruby
require 'forwardable'

module CacheProxy
  extend Forwardable
  def_delegators :@store, :[], :[]=, :delete

  def initialize(store)
    @store = store
  end
end

class Session
  include CacheProxy
end
```

Clients of `Session` get direct calls to the underlying `@store` methods.
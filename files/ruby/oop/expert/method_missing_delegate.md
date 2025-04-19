## 🧩 Advanced Delegation with method_missing and respond_to_missing?

Implement `method_missing` alongside `respond_to_missing?` to delegate unknown method calls dynamically while preserving introspection compatibility. This pattern can wrap external services or internal collaborators seamlessly.

```ruby
class APIClient
  def initialize(adapter)
    @adapter = adapter
  end

  def method_missing(name, *args, &block)
    if @adapter.respond_to?(name)
      @adapter.public_send(name, *args, &block)
    else
      super
    end
  end

  def respond_to_missing?(name, include_private = false)
    @adapter.respond_to?(name, include_private) || super
  end
end
```
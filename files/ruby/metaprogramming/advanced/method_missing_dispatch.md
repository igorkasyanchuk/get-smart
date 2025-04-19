## ✨ Advanced `method_missing` dispatch for dynamic APIs
Override `method_missing` and `respond_to_missing?` to route undefined calls to external services or dynamic handlers. This pattern lets you lazily handle arbitrary methods while still integrating smoothly with reflection.

```ruby
class DynamicClient
  def method_missing(name, *args, &block)
    if valid_endpoint?(name)
      call_api(name, *args)
    else
      super
    end
  end

  def respond_to_missing?(name, include_all)
    valid_endpoint?(name) || super
  end
end
```
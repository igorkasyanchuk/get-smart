## 💡 Forwarding to `super` for Safe Fallbacks

Always call `super` at the end of `method_missing` if you don't handle a particular method; this ensures Ruby can still raise the usual `NoMethodError`. Skipping `super` may hide real mistakes in your code.

```ruby
class SafeWrapper
  def method_missing(name, *args, &block)
    if name.to_s.start_with?('do_')
      puts "Performing \#{name}\" with args: #{args.join(', ')}"
    else
      super
    end
  end

  def respond_to_missing?(name, include_private = false)
    name.to_s.start_with?('do_') || super
  end
end

wrapper = SafeWrapper.new
wrapper.do_something('foo')  # Works
wrapper.unknown_method       # Raises NoMethodError
```
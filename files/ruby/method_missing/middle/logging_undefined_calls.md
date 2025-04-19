## 🐞 Logging and Debugging Undefined Methods
Intercepting undefined calls helps trace where missing methods originate. Useful during refactoring to detect accidental calls or to provide informative error messages.

```ruby
class Debugger
  def method_missing(name, *args)
    warn "[DEBUG] Attempted to call #{name} with args: #{args.inspect}"
    super
  end

  def respond_to_missing?(name, include_private = false)
    false
  end
end

dbg = Debugger.new
dbg.nonexistent_method(123)
# STDERR: [DEBUG] Attempted to call nonexistent_method with args: [123]
# => NoMethodError: undefined method `nonexistent_method' for #<Debugger:...>
```
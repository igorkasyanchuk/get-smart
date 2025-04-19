## 🔗 Binding of Caller for Stack Frame Inspection

Use the `binding_of_caller` gem to access and inspect bindings up the call stack. This allows you to peek into local variables and state deep within utility methods or Rails internals without rewriting your code to pass context manually.

```ruby
# Gemfile
gem 'binding_of_caller'

# Somewhere deep inside a helper or library method
def deep_compute(a, b)
  # Capture the binding two frames up
  caller_binding = binding.of_caller(2)
  caller_locals = caller_binding.local_variables.map { |var| [var, caller_binding.local_variable_get(var)] }
  Rails.logger.debug("Caller locals: ")
  Rails.logger.debug(caller_locals.inspect)
  a + b
end
```

You can also use this within a byebug session to modify local variables of a previous frame:

```ruby
(byebug) frame 3
(byebug) eval local_var = 'new value'
```

This method gives you unprecedented visibility into the inner workings of your Rails stack.
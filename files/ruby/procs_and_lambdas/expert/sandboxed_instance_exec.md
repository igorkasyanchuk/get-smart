## 🔒 Safe Execution Using `instance_exec` with Lambdas
Sandbox dynamic code by running user-provided lambdas with restricted receivers via `instance_exec`. Limit accessible methods by creating a minimal context object, preventing unauthorized method calls.

```ruby
safe_context = Object.new
class << safe_context
  undef_method :method_missing
  def allowed
    "safe"
  end
end

user_lambda = -> { allowed + " world" }
result = safe_context.instance_exec(&user_lambda)
puts result # => "safe world"
```

Use this to evaluate user scripts or configuration without exposing the full application API.
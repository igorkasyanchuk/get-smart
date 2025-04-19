## 🔤 String Inflection Helpers
ActiveSupport adds powerful string transformation methods for model names, URLs, and human-readable text. Use `underscore`, `camelize`, `parameterize`, and `titleize` to handle naming conventions safely.

```ruby
"ActiveSupport::JSON".underscore       # => "active_support/json"
"active_support/json".camelize        # => "ActiveSupport::Json"
"rails is awesome".parameterize       # => "rails-is-awesome"
"hello world".titleize                # => "Hello World"
```

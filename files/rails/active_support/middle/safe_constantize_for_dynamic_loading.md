## 🗝️ `String#safe_constantize` for Dynamic Class Loading
When loading classes or modules by name, `safe_constantize` returns `nil` instead of raising `NameError`. This helps avoid exception handling for optional or dynamically generated constants.

```ruby
"MyModule::MyClass".safe_constantize   # => MyModule::MyClass
"UnknownClass".safe_constantize       # => nil
klass = params[:type].safe_constantize || DefaultProcessor
processor = klass.new
```

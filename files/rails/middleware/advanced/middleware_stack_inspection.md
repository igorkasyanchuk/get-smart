## 🔍 Middleware Stack Inspection and Modification at Runtime
Advanced debugging may require inspecting or modifying the middleware stack on the fly. Use `Rails.application.middleware` to list, insert, delete, or swap middlewares dynamically, even in a console or during an initializer.

```ruby
# Inspect current stack
Rails.application.middleware.each_with_index do |middleware, index|
  puts "#{index}: #{middleware.klass} (args: #{middleware.args})"
end

# Remove a middleware
Rails.application.middleware.delete Rack::Runtime

# Swap two middlewares
stack = Rails.application.middleware
runtime_index = stack.index { |m| m.klass == Rack::Runtime }
logger_index  = stack.index { |m| m.klass == Rails::Rack::Logger }
stack.swap(runtime_index, logger_index) if runtime_index && logger_index
```

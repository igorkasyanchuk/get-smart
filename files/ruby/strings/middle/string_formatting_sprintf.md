## 📐 Format with sprintf and format
Ruby’s `sprintf` (or alias `format`) allows C-style formatting directives for numbers, strings, and more. Use `%d`, `%f`, `%s`, and precision/width specifiers for aligned reports or human-readable output. It’s safer and clearer than manual padding or rounding.

```ruby
name = "Carol"
balance = 1234.5
puts sprintf("%-10s | %08.2f", name, balance)
# => "Carol      | 0001234.50"
# Using format alias
puts format("[%s] %0.3f%% complete", name, 99.8765)
# => "[Carol] 99.877% complete"
```
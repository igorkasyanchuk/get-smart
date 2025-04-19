## 🚀 Drop into IRB with binding.irb
Use `binding.irb` in your scripts to launch an IRB session at runtime. This is perfect for debugging or exploring state in the middle of execution.

```ruby
# example_script.rb
require 'irb'
require 'irb/completion'

puts "Before debugging"
binding.irb  # execution stops here and opens IRB
puts "After debugging"
```

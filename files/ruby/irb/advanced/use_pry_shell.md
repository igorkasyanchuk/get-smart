## 🔍 Using Pry Commands Inside IRB

You can drop into a Pry REPL without leaving your IRB session by requiring Pry and invoking it directly. This hybrid approach lets you benefit from both tools in one console.

```ruby
# ~/.irbrc
begin
  require 'pry'
  IRB.conf[:MAGIC_WORDS]['/pry'] = proc { binding.pry }
rescue LoadError
  warn 'Install pry to enable /pry command'
end
# Usage:
# /pry
```
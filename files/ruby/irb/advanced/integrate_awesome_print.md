## 📈 Integrating AwesomePrint for Better Inspection

AwesomePrint provides colorized, pretty-printed output for complex objects. Integrate it with IRB so every `inspect` call goes through AwesomePrint by default.

```ruby
# ~/.irbrc
begin
  require 'awesome_print'
  AwesomePrint.irb!
rescue LoadError
  warn 'Install awesome_print gem for enhanced output'
end
```
## 🔁 Rebinding `UnboundMethod` for flexible composition
Extract methods as `UnboundMethod` objects, modify or wrap them, and rebind to different classes or instances, enabling advanced method sharing patterns.

```ruby
module Formatter
  def format_text(text)
    text.strip.upcase
  end
end

um = Formatter.instance_method(:format_text)
String.class_eval { define_method(:format_custom, um) }

" hello ".format_custom # => "HELLO"
```
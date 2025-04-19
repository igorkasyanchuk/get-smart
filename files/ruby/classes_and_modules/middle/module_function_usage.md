## ✨ Converting Module Methods to Both Instance and Module Functions

`module_function` lets you reuse methods internally as private instance methods and externally as module (or class) methods. It’s helpful for utility modules that need consistent behavior across contexts.

```ruby
module Formatter
  module_function

  def truncate(text, length)
    text[0...length] + '...'
  end
end

# As module method
e = Formatter.truncate("Hello, World!", 5)
# => "Hello..."

# As private instance method
class Post
  include Formatter

  def summary
    truncate(content, 10)
  end
end
```
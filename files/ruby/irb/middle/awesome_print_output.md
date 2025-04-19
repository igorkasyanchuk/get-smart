## ✨ Format Output with AwesomePrint
Use the `awesome_print` gem for more readable inspection of complex objects. Monkey-patch IRB’s output to call `ap` instead of the default inspect.

```ruby
# ~/.irbrc
require 'awesome_print'

IRB::Irb.class_eval do
  def output_value
    ap @context.last_value
  end
end
```
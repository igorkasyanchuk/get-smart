## 🤝 Include Modules as Mixins

Mixins let classes borrow module methods by using the `include` keyword. Included methods become instance methods of the class. This shares behavior without inheritance.

```ruby
module Greetings
  def hello
    'Hi there!'
  end
end

class Person
  include Greetings
end

puts Person.new.hello  # => 'Hi there!'
```
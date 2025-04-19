## 🔗 Converting a Fiber into an Enumerator
Ruby’s `Enumerator::Producer` can wrap a fiber to produce an external iterator. This technique lets you expose fiber logic via the familiar `each` or `next` interface, integrating seamlessly with Ruby’s enumerable methods.

```ruby
require 'enumerator'

enum = Enumerator.new do |yielder|
  fiber = Fiber.new do
    3.times do |i|
      yielder << i * i
    end
  end
  fiber.resume until fiber.alive? == false
end

enum.each do |value|
  puts "Value: #{value}"  # Outputs 0, 1, 4
end
```
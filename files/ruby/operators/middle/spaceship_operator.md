## 🚀 Spaceship Operator
The `<=>` operator returns `-1`, `0`, or `1` when comparing two objects. It's ideal for custom sorting and implementing the `Comparable` module.

```ruby
5 <=> 10   # => -1
10 <=> 10  # => 0
15 <=> 10  # => 1

class Person
  include Comparable
  attr_reader :age
  def initialize(age); @age = age; end
  def <=>(other)
    age <=> other.age
  end
end

people.sort # sorts by age
```
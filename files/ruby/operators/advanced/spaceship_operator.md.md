## 🚀 Spaceship Operator for Custom Sorting

The spaceship operator (`<=>`) returns -1, 0, or 1, making it the core of Ruby’s `<`, `>`, and sorting logic. Implement it in custom classes to define ordering semantics concisely.

```ruby
class Version
  include Comparable
  attr_reader :parts
  def initialize(str)
    @parts = str.split('.').map(&:to_i)
  end
  def <=>(other)
    parts <=> other.parts
  end
  def to_s
    parts.join('.')
  end
end

versions = [Version.new("2.1"), Version.new("1.10"), Version.new("2.0")]
sorted = versions.sort
printf "%s\n", sorted
# 1.10
# 2.0
# 2.1
```
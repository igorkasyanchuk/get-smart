## 📝 Defining Test Cases
Your test classes should inherit from `Minitest::Test`, and each test method must start with `test_`. The method name describes what you’re testing, making your suite self‑documenting. Use descriptive names to clarify intent and organize related checks together.

```ruby
require 'minitest/autorun'

class MathTest < Minitest::Test
  def test_addition
    sum = 2 + 3
    assert_equal 5, sum
  end
end
```
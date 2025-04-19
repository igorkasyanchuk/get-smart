## ✅ Using Common Assertions
Minitest provides a rich set of assertion methods to verify behavior. Use `assert_equal` for value comparison, `assert_nil` to check for `nil`, and `assert_includes` to verify a collection contains an element. Applying the right assertion makes failures easier to understand.

```ruby
require 'minitest/autorun'

class AssertionTest < Minitest::Test
  def test_collection
    list = [1, 2, 3]
    assert_includes list, 2
    assert_equal 3, list.size
    assert_nil nil
  end
end
```
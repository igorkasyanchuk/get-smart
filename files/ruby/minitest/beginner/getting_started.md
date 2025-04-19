## 🔧 Getting Started with Minitest
Minitest is included in Ruby’s standard library, so you can start writing tests without extra installation. Simply require `minitest/autorun` at the top of your test file to enable the automatic test runner and reporting. Then run your tests with `ruby`, like `ruby test_example.rb`, to see the results.

```ruby
require 'minitest/autorun'

class TestExample < Minitest::Test
  def test_truth
    assert true
  end
end
```
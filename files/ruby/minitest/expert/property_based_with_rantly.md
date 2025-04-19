## 🎲 Property-Based Testing with Rantly

Inject randomness by combining Minitest with Rantly for property-based tests. This helps reveal edge cases that fixed fixtures might miss.

```ruby
# test/property/test_string_reversibility.rb
require 'test_helper'
require 'rantly'
require 'rantly/shrinks'

class StringPropertyTest < Minitest::Test
  def test_reverse_twice_returns_original
    property_of { string }.check do |random_str|
      assert_equal random_str, random_str.reverse.reverse
    end
  end
end
```

Run with a seed for reproducibility:  
```bash
SEED=12345 ruby -Itest test/property/test_string_reversibility.rb
```
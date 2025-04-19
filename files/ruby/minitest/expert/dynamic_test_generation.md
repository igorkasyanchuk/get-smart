## 🔄 Dynamic Test Generation via Metaprogramming

For data-driven scenarios, generate tests at runtime using `define_method`. This approach reduces duplication and lets you loop over complex datasets or introspect code.

```ruby
# test/models/user_test.rb
require 'test_helper'

USER_FIXTURES = {
  valid:  { name: 'Alice', email: 'alice@example.com' },
  missing_email: { name: 'Bob', email: nil }
}

class UserTest < ActiveSupport::TestCase
  USER_FIXTURES.each do |key, attrs|
    define_method("test_#{key}_validation") do
      user = User.new(attrs)
      expected = key == :valid
      assert_equal expected, user.valid?, "Expected #{key} to #{expected ? 'pass' : 'fail'} validation"
    end
  end
end
```
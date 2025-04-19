## 🛠️ Use setup and teardown Hooks
Using `setup` and `teardown` helps you DRY up your tests by extracting common initialization and cleanup logic. This ensures each test starts with a known state and frees resources afterward.

```ruby
require 'minitest/autorun'

class UserTest < Minitest::Test
  def setup
    @user = User.new(name: "Alice", admin: false)
  end

  def teardown
    # e.g., clear temp files or reset environment
    FileUtils.rm_rf(Dir['tmp/test_*'])
  end

  def test_default_role
    assert_equal false, @user.admin
  end

  def test_name_presence
    refute_nil @user.name
  end
end
```

Place shared objects in `setup` and cleanup in `teardown` to keep tests concise and maintainable.
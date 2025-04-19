## 🔍 Setup and Teardown Hooks
When you have repeated preparation or cleanup tasks, use `setup` and `teardown` hooks to DRY up your tests. `setup` runs before each test, and `teardown` runs after, ensuring a clean state. This practice keeps tests isolated and easier to maintain.

```ruby
require 'minitest/autorun'

class UserTest < Minitest::Test
  def setup
    @user = User.new(name: 'Test User')
  end

  def teardown
    @user = nil
  end

  def test_user_name
    assert_equal 'Test User', @user.name
  end
end
```
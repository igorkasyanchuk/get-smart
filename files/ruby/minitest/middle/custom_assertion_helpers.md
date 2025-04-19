## ✨ Define Custom Assertion Helpers
When you find yourself repeating complex checks, extract them into helper methods. This keeps tests readable and centralizes logic for easier updates.

```ruby
module CustomAssertions
  def assert_uuid_format(value)
    uuid_regex = /^[0-9a-f]{8}-[0-9a-f]{4}-[1-5][0-9a-f]{3}-[89ab][0-9a-f]{3}-[0-9a-f]{12}$/i
    assert_match uuid_regex, value, "Expected #{value} to be a valid UUID"
  end
end

class ApiResponseTest < Minitest::Test
  include CustomAssertions

  def test_user_id_is_uuid
    id = ApiClient.fetch_user_id(42)
    assert_uuid_format id
  end
end
```

Place `CustomAssertions` in `test/test_helpers` and require it in `test_helper.rb` to reuse across test classes.
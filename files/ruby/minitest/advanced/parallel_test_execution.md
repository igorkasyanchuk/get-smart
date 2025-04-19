## ⚡️ Parallelize Test Suite

Leveraging Minitest’s built-in parallelization can dramatically reduce test suite runtime by distributing tests across multiple threads or processes. Use the `-j` CLI flag or `parallelize_me!` in your test classes to enable parallel execution. Ensure your tests are isolated and thread-safe before parallelizing to avoid intermittent failures.

```ruby
# Run the entire suite using 4 threads
$ ruby -Ilib:test -rminitest/autorun test/**/*_test.rb -j4
```

```ruby
require 'minitest/autorun'
class UserServiceTest < Minitest::Test
  parallelize_me!  # Enables thread-based parallel execution

  def test_create_user
    user = User.new(name: 'Alice')
    assert user.save
  end
end
```

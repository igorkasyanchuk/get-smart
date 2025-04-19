## ⚡ Parallel Test Execution and Sharding

Leverage test-level parallelism and custom sharding logic to run large suites across multiple cores or CI nodes. Use `parallelize_me!` in Rails, or manually fork processes for pure Ruby.

```ruby
# test/test_helper.rb
require 'parallel_tests'

class ActiveSupport::TestCase
  # automatically splits tests into N shards
  parallelize(workers: ENV.fetch('TEST_WORKERS', 4).to_i)
end
```

In CI, set `TEST_WORKERS` per node and specify `TEST_ENV_NUMBER` to pick a shard:

```bash
# On Node 1
TEST_WORKERS=4 TEST_ENV_NUMBER=1 bundle exec rake test
# On Node 2
TEST_WORKERS=4 TEST_ENV_NUMBER=2 bundle exec rake test
```
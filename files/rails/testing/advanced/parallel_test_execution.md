## 🏎️ Parallel Test Execution
Leverage parallelization to drastically reduce your test suite runtime by utilizing Rails' built‑in parallel testing for Minitest or the `parallel_tests` gem for RSpec. Configure the worker count based on your CPU cores and ensure each parallel process uses its own test database.

```ruby
# For Minitest (Rails 6+), in test/test_helper.rb:
class ActiveSupport::TestCase
  parallelize(workers: :number_of_processors)
end

# For RSpec, add to Gemfile:
gem 'parallel_tests'

# Then run:
bundle exec rake parallel:create parallel:spec PARALLEL_TEST_PROCESSORS=4
```

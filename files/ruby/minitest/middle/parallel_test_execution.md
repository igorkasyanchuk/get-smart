## ⚡ Run Tests in Parallel
Speed up your suite by enabling parallel test execution. Minitest can run tests in separate processes or threads, taking advantage of multi‑core machines.

```ruby
# In test_helper.rb
require 'minitest/autorun'

env = ENV.fetch('TEST_ENV_NUMBER', 0).to_i
Minitest.parallel_executor = Minitest::Parallel::Executor.new(Process.pid, ENV['PARALLEL_WORKERS'].to_i) if env == 0

# Or simply:
# Minitest::Runnable.runnable_methods.each { |m| parallelize_me! }
```

Then run with:

```bash
# Use 4 parallel workers
PARALLEL_WORKERS=4 ruby -Ilib:test test/**/*_test.rb
```

Parallelization significantly reduces CI time for large test suites.
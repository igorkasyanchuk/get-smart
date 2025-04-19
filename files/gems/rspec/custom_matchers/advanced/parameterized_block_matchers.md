## ⚡ Parameterized Matchers with supports_block_expectations

Custom block matchers let you test behavior around blocks or procs and accept parameters. By declaring `supports_block_expectations`, you allow `expect { … }` syntax and can pass arguments into your matcher for dynamic assertions.

```ruby
# spec/support/matchers/yield_successfully_with.rb
RSpec::Matchers.define :yield_successfully_with do |*args|
  supports_block_expectations

  match do |actual_block|
    begin
      actual_block.call(*args)
      true
    rescue => e
      @error = e
      false
    end
  end

  failure_message do
    "expected block to yield successfully with #{args.inspect}, but it raised #{@error.class}: #{@error.message}"
  end
end
```

Usage:

```ruby
expect { |b| perform_async_task(5, &b) }.to yield_successfully_with(5)
```
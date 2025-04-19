## ⏱️ Wrap Examples in Transactions with around(:each)

Speed up tests that require database rollbacks or time manipulation by combining transactional fixtures with time-travel. Use `around(:each)` to wrap each example in a transaction and reset time with `Timecop`.

```ruby
# spec/support/around_transaction_timecop.rb
RSpec.configure do |config|
  config.around(:each) do |example|
    ActiveRecord::Base.connection.transaction(joinable: false, rollback: :always) do
      Timecop.freeze(Time.now) do
        example.run
      end
    end
  end
end
```

In this setup:
- `transaction(..., rollback: :always)` ensures each example is rolled back after running.
- `Timecop.freeze` pins the clock at the example start, guaranteeing reproducible time-based assertions.

Now you can safely mutate time and database state without polluting other examples.
## 🔀 Conditional Hooks via Metadata and prepend/append

Improve hook control by scoping them to metadata tags and fine-tuning execution order with `prepend: true` or `append: true`. This helps when certain specs need extra setup or cleanup.

```ruby
# spec/rails_helper.rb
RSpec.configure do |config|
  # Run DB cleaner before JS-tagged examples and ensure it runs first
  config.before(:each, js: true, prepend: true) do
    DatabaseCleaner.strategy = :truncation
    DatabaseCleaner.start
  end

  # Switch back to transaction strategy for non-JS examples
  config.before(:each, js: false) do
    DatabaseCleaner.strategy = :transaction
    DatabaseCleaner.start
  end

  # Always cleanup after any example
  config.after(:each, append: true) do
    DatabaseCleaner.clean
  end
end
```

Here:
- `js: true` metadata lets you target feature specs needing JavaScript.
- `prepend: true` ensures the truncation strategy is set before any other `before` hooks.
- `append: true` makes cleanup run after all other `after` hooks, avoiding stray data.

Combine metadata with selective hooks to tailor setup/teardown per example group or tag.
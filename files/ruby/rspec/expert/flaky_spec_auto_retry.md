## 🔄 Flaky Spec Auto-Retry via Metadata

Implement a lightweight retry mechanism for flaky tests directly in RSpec without external gems. Use an `around` hook that checks a custom `:retry` metadata key, rescues failures, and retries the example up to the specified count.

```ruby
# spec/spec_helper.rb
RSpec.configure do |config|
  config.around(:each) do |example|
    retries = example.metadata[:retry] || 0
    attempts = 0
    begin
      attempts += 1
      example.run
    rescue Exception => e
      retry if attempts <= retries
      raise e
    end
  end
end
```

```ruby
# spec/features/payment_flow_spec.rb
RSpec.describe 'PaymentFlow', :retry => 3 do
  it 'completes within 500ms under load' do
    expect { run_heavy_payment_load }.not_to raise_error
  end
end
```

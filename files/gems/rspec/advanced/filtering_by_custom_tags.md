## 🏷️ Filter Specs by Custom Metadata Tags

RSpec allows you to tag examples or groups with arbitrary metadata, then include or exclude them in your run. This is perfect for isolating slow or flaky tests without touching code. Use the `--tag` CLI or configure filters in `spec_helper.rb` to manage test execution dynamically.

```ruby
# In spec files
RSpec.describe 'Payment Gateway', :slow, priority: :high do
  it 'processes large batch transactions' do
    # long-running spec
  end
end

# Run only high-priority specs
spec/spec_helper.rb:
RSpec.configure do |config|
  config.filter_run_when_matching priority: :high
  config.filter_run_excluding slow: true
end
```
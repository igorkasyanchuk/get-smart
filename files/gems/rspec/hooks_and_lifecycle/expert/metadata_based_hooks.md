## 🏷️ Dynamic Hook Application via Metadata

Automatically apply setup or teardown logic based on example metadata using `define_derived_metadata` and filtered hooks. This is powerful for large suites where tests require nuanced behavior without repetitive tag usage. Combine metadata inheritance with conditional hooks for maximum flexibility.

```ruby
RSpec.configure do |config|
  # Derive :db_clean => true for all example groups tagged :integration
  config.define_derived_metadata(file_path: %r{/spec/integration/}) do |meta|
    meta[:db_clean] = true
  end

  # Only run database cleaning around examples with :db_clean
  config.around(:each, :db_clean) do |example|
    DatabaseCleaner.cleaning do
      example.run
    end
  end
end

# No need to tag explicitly; any spec under spec/integration/ is cleaned
RSpec.describe 'External API Integration', type: :request do
  it 'persists and cleans DB' do
    expect(User.count).to eq(0)
    User.create!(name: 'Test')
    expect(User.count).to eq(1)
  end
end
```

This technique offloads tagging boilerplate and ensures context-aware hooks without manual metadata on each example.
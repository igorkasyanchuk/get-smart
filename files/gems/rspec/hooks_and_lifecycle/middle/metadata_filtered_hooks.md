## 🎯 Conditional Hooks with Metadata Filters

Leverage metadata tags to run hooks only for specific examples or groups. This keeps your setup lightweight and targeted when you have mixed test types (e.g., `:js`, `:api`, or custom tags).

```ruby
RSpec.configure do |config|
  # Only run before hooks for examples tagged with :db_cleanup
  config.before(:each, db_cleanup: true) do
    DatabaseCleaner.start
  end

  config.after(:each, db_cleanup: true) do
    DatabaseCleaner.clean
  end
end

RSpec.describe UserAPI, db_cleanup: true do
  it 'creates a user and cleans up the DB' do
    post '/users', params: { name: 'Alice' }
    expect(response.status).to eq(201)
  end
end

RSpec.describe SomeOtherService do
  # This spec won't trigger the DB cleanup hooks
  it 'does a pure unit test' do
    expect(1 + 1).to eq(2)
  end
end
```

By scoping hooks with metadata, you avoid unnecessary overhead in specs that don’t require database cleaning.
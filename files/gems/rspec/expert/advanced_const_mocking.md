## 🛠 Mock and Stub Private Constants with `stub_const`
When you need to override deeply nested or private constants (e.g., feature flags or third‑party clients), `stub_const` ensures isolation without altering production code.

```ruby
module Feature
  PRIVATE_API_URL = 'https://api.example.com'.freeze
end

RSpec.describe MyService do
  before do
    stub_const('Feature::PRIVATE_API_URL', 'https://staging.example.com')
  end

  it 'uses the stubbed URL during request' do
    expect(MyService.call).to include('staging.example.com')
  end
end
```
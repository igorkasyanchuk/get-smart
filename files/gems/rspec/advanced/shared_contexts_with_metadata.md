## 🗂️ Leverage Shared Contexts with Metadata

Shared contexts can be conditionally included using metadata filters, reducing duplication for setup logic across groups. By tagging examples, you dynamically inject common `let`, hooks, or helper methods only where needed. This keeps global setup lean and speeds up your test suite.

```ruby
# spec/support/shared_contexts/api_helpers.rb
RSpec.shared_context 'API client', :api_helper do
  let(:api_client) { ApiClient.new(token: ENV['API_TOKEN']) }
  before { api_client.authenticate }
end

# Usage in spec
RSpec.describe 'External service', :api_helper do
  it 'fetches user data' do
    expect(api_client.fetch_user(1)).to include('id' => 1)
  end
end
```
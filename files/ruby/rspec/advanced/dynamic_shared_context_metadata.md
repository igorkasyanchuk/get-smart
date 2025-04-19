## 🔄 Dynamic Shared Context with Metadata

Leverage RSpec’s shared contexts combined with metadata filters to DRY up specs and apply setups conditionally. By tagging examples or groups, shared setup logic is only invoked where it makes sense, keeping unrelated tests fast and isolated.

```ruby
# spec/support/shared_contexts.rb
RSpec.shared_context 'api client setup', shared_context: :metadata do
  let(:client) { ApiClient.new(base_url: ENV['API_URL']) }

  before do |example|
    # dynamically stub based on metadata
    stub_request(:get, example.metadata[:endpoint])
      .to_return(body: example.metadata[:response_body])
  end
end

# spec/requests/users_spec.rb
describe 'Users API', endpoint: '/users', response_body: '[{"id":1}]' do
  include_context 'api client setup'

  it 'fetches users successfully' do
    expect(client.get('/users')).to include('id' => 1)
  end
end
```
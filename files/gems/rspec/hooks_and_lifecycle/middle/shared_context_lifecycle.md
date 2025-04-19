## 📦 DRY Specs with Shared Contexts and Hooks

Use `shared_context` to group common hooks and helper methods for multiple example groups. This approach promotes DRY specs and centralized lifecycle management.

```ruby
# spec/support/api_helpers.rb
RSpec.shared_context 'API setup' do
  before(:all) do
    @api_client = ApiClient.new(base_url: 'http://test.local')
  end

  after(:all) do
    @api_client.close
  end

  let(:auth_token) { @api_client.authenticate('user', 'pass') }
end

# spec/requests/user_spec.rb
RSpec.describe 'User API', type: :request do
  include_context 'API setup'

  it 'fetches user profile' do
    get '/profile', headers: { 'Authorization' => auth_token }
    expect(response).to have_http_status(:ok)
  end
end

# spec/requests/order_spec.rb
RSpec.describe 'Order API', type: :request do
  include_context 'API setup'

  it 'creates an order' do
    post '/orders', headers: { 'Authorization' => auth_token }, params: { item: 'Book' }
    expect(response).to have_http_status(:created)
  end
end
```

By extracting shared hooks and data into a context, you keep your specs concise and maintain a single source of truth for lifecycle steps.
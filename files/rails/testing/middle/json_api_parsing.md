## 🗄 Testing JSON APIs with Parsed Response

In request specs, parse JSON responses into Ruby hashes to assert on structure and values. This makes your tests more expressive and avoids brittle string matching.

```ruby
# spec/requests/api/v1/users_spec.rb
describe 'GET /api/v1/users', type: :request do
  let!(:users) { create_list(:user, 3) }

  before { get '/api/v1/users', headers: { 'Accept' => 'application/json' } }

  it 'returns all users' do
    expect(response).to have_http_status(:ok)
    json = JSON.parse(response.body)
    expect(json['users'].size).to eq 3
    expect(json['users'].first).to include('id', 'email')
  end
end
```

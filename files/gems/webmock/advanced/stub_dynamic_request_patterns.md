## 🔥 Dynamic URL Pattern Stubbing
When testing APIs that include dynamic segments in URLs (e.g., IDs or timestamps), you can use regular expressions to stub multiple endpoints with one rule. This prevents repetitive stubs and keeps tests DRY. You can capture segments to use in your response logic.

```ruby
require 'webmock/rspec'

RSpec.describe "Dynamic endpoint stubs" do
  include WebMock::API

  before do
    # Stub any GET to /users/<number>/posts
    stub_request(:get, %r{https://api\.example\.com/users/\d+/posts})
      .to_return do |request|
        user_id = request.uri.path.split('/')[2]
        {
          status: 200,
          body: { user_id: user_id, posts: [] }.to_json,
          headers: { 'Content-Type' => 'application/json' }
        }
      end
  end

  it "returns a tailored response based on the captured user ID" do
    response = Net::HTTP.get(URI('https://api.example.com/users/42/posts'))
    data = JSON.parse(response)

    expect(data['user_id']).to eq('42')
    expect(data['posts']).to eq([])
  end
end
```
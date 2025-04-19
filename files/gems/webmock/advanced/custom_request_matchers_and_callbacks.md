## ⚙️ Custom Request Matchers and Callbacks
For complex scenarios, you can create custom matchers or use callback blocks in `to_return` to inspect and manipulate requests or responses dynamically. This is ideal for testing conditional logic based on headers, bodies, or query params.

```ruby
require 'webmock/rspec'

# Custom matcher that checks for JSON API compliance
WebMock::RequestRegistry.instance.register_global_stub do |request|
  if request.uri.path == '/api/v2/resource' && request.headers['Content-Type'] =~ /application\/json/
    true
  else
    false
  end
end

RSpec.describe "Custom matcher with callback" do
  include WebMock::API

  before do
    stub_request(:post, 'https://api.example.com/api/v2/resource')
      .with(headers: { 'Content-Type' => 'application/json' })
      .to_return do |request|
        payload = JSON.parse(request.body)
        if payload['action'] == 'create'
          { status: 201, body: { result: 'created' }.to_json }
        else
          { status: 400, body: { error: 'unsupported action' }.to_json }
        end
      end
  end

  it "handles create actions" do
    response = Net::HTTP.post(
      URI('https://api.example.com/api/v2/resource'),
      { action: 'create' }.to_json,
      'Content-Type' => 'application/json'
    )

    expect(response.code).to eq('201')
    expect(JSON.parse(response.body)['result']).to eq('created')
  end

  it "rejects unsupported actions" do
    response = Net::HTTP.post(
      URI('https://api.example.com/api/v2/resource'),
      { action: 'delete' }.to_json,
      'Content-Type' => 'application/json'
    )

    expect(response.code).to eq('400')
    expect(JSON.parse(response.body)['error']).to eq('unsupported action')
  end
end
```
## 🧪 Test Middleware in Isolation

Use `Rack::MockRequest` to verify your middleware behaves correctly without booting the full Rails app. It helps you assert headers, status codes, or response modifications.

```ruby
# spec/middleware/request_logger_spec.rb
require 'rack/mock'
require_relative '../../app/middleware/request_logger'

RSpec.describe RequestLogger do
  let(:app) { ->(env) { [200, {'Content-Type' => 'text/plain'}, ['OK']] } }
  let(:middleware) { RequestLogger.new(app) }
  let(:request) { Rack::MockRequest.new(middleware) }

  it 'returns the downstream status and response' do
    response = request.get('/test?foo=bar')
    expect(response.status).to eq(200)
    expect(response.body).to eq('OK')
  end
end
```

You can also stub `Rails.logger` to assert that log messages are generated as expected.
## 🔄 Advanced Parametrized Shared Examples
Leverage shared examples with `let` and `subject` overrides for highly parameterizable test suites. This technique avoids duplication when testing multiple class variants or configurations.

```ruby
RSpec.shared_examples 'an API endpoint' do |http_method, path, status|
  subject { request.send(http_method, path) }

  it "responds with #{status}" do
    subject
    expect(response).to have_http_status(status)
  end
end

RSpec.describe 'Accounts API', type: :request do
  include_examples 'an API endpoint', :get, '/api/accounts', :ok
  include_examples 'an API endpoint', :post, '/api/accounts', :created
end
```
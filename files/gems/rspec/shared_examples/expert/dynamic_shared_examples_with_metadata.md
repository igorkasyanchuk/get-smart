## ⚙️ Dynamic Shared Examples with Metadata Filtering

Leverage RSpec's metadata hooks to automatically include shared examples across multiple spec contexts based on custom metadata. This approach eliminates repetitive `include_examples` calls and centralizes endpoint compliance tests for APIs or other components.

In `spec/support/shared_examples/api_compliance.rb`, define your shared examples:

```ruby
# spec/support/shared_examples/api_compliance.rb
RSpec.shared_examples 'API Endpoint Compliance' do |endpoint|
  subject { get endpoint }

  it 'responds with 200 OK' do
    subject
    expect(response).to have_http_status(:ok)
  end

  it 'returns JSON content type' do
    subject
    expect(response.media_type).to eq('application/json')
  end
end
```

Then, in your RSpec configuration, tag specs under `spec/requests` with `:api_endpoint` metadata and auto-include the shared examples:

```ruby
# spec/rails_helper.rb or spec/support/rspec_config.rb
RSpec.configure do |config|
  # Derive :api_endpoint metadata from the example group description
  config.define_derived_metadata(file_path: %r{spec/requests/}) do |meta|
    meta[:api_endpoint] = "/api/#{meta[:description].parameterize}" if meta[:description]
  end

  # After the context is defined, automatically include the compliance specs
  config.after(:context, type: :request) do
    if metadata[:api_endpoint]
      include_examples 'API Endpoint Compliance', metadata[:api_endpoint]
    end
  end
end
```

Now any request spec under `spec/requests` will enforce your API compliance automatically.

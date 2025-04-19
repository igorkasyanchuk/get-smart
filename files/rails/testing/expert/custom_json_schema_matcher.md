## 📐 Build a Custom JSON Schema Matcher for API Responses

Validate JSON API contracts by creating a reusable RSpec matcher powered by **json_schemer**. It ensures your responses adhere to your OpenAPI or JSON Schema definitions.

```ruby
# Gemfile
gem 'json_schemer'
```

```ruby
# spec/support/json_schema_matcher.rb
require 'json_schemer'

RSpec::Matchers.define :match_json_schema do |schema_name|
  match do |response_body|
    schema_path = Rails.root.join('schemas', "#{schema_name}.json")
    schema = JSON.parse(File.read(schema_path))
    JSONSchemer.schema(schema).valid?(JSON.parse(response_body))
  end
end
```

Usage in request spec:

```ruby
RSpec.describe 'Users API', type: :request do
  it 'returns user info matching schema' do
    get '/api/users/1'
    expect(response).to have_http_status(:ok)
    expect(response.body).to match_json_schema('user')
  end
end
```

Place your `user.json` schema in `schemas/` to keep contracts versioned and testable.
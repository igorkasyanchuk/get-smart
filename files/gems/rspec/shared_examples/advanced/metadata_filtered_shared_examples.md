## 🏷️ Metadata-Driven Shared Examples
Leverage RSpec metadata to parameterize and filter shared examples dynamically. By tagging example groups with custom metadata, you can conditionally include or exclude shared behavior without duplicating code.

```ruby
# spec/support/shared_examples/resource_behaviors.rb
RSpec.shared_examples 'resource endpoints' do
  context 'when resource is created' do
    it 'returns status 201' do
      post endpoint, params: valid_params
      expect(response).to have_http_status(:created)
    end
  end

  context 'when unauthorized' do
    it 'returns status 401' do
      post endpoint, params: valid_params, headers: { Authorization: 'invalid' }
      expect(response).to have_http_status(:unauthorized)
    end
  end
end

# spec/controllers/users_controller_spec.rb
RSpec.describe UsersController, type: :request, resource: :user do
  let(:endpoint)    { '/users' }
  let(:valid_params){ { user: attributes_for(:user) } }

  include_examples 'resource endpoints' if RSpec.current_example.metadata[:resource] == :user
end
```

This approach uses `:resource` metadata to ensure only the relevant shared examples run in that context. You can expand metadata checks for roles, versions, or feature flags.
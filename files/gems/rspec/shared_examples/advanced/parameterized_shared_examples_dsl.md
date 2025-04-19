## 🔧 Parameterized Shared Examples with Arguments
Create highly reusable shared examples by accepting arguments in the block definition. RSpec lets you define parameters that customize each inclusion, turning your shared logic into a mini-DSL.

```ruby
# spec/support/shared_examples/paginatable.rb
RSpec.shared_examples 'a paginatable endpoint' do |model:, route:|
  let(:records) { create_list(model.name.underscore.to_sym, 3) }

  it 'paginates results' do
    get route, params: { page: 2, per_page: 1 }
    body = JSON.parse(response.body)

    expect(body.size).to eq(1)
    expect(body.first['id']).to eq(records.second.id)
  end
end

# spec/requests/users_spec.rb
RSpec.describe '/users', type: :request do
  include_examples 'a paginatable endpoint', model: User, route: '/users'
end
```

By passing a hash of keyword arguments (`model:` and `route:`), you can tailor the shared examples to any resource. This pattern drastically reduces boilerplate when testing similar behaviors across controllers or APIs.
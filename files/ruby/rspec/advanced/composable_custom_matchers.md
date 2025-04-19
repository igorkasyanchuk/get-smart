## 🧩 Composable Custom Matchers for Complex Expectations

Build reusable, chainable matchers to express multi-step assertions clearly. Custom matchers can wrap existing ones and accept parameters, making your specs more descriptive and reducing boilerplate.

```ruby
# spec/support/matchers/have_json_attributes.rb
RSpec::Matchers.define :have_json_attributes do |**expected|
  match do |response|
    json = JSON.parse(response.body)
    expected.all? { |k, v| json[k.to_s] == v }
  end

  chain :with_status do |status|
    @status = status
  end

  match_when_negated do |response|;
    false
  end

  failure_message do |response|
    "expected #{response.body} to have #{expected} with status #{@status}"
  end
end

# spec/controllers/posts_controller_spec.rb
describe PostsController do
  describe 'GET #show' do
    before { get :show, params: {id: 1} }

    it 'returns correct JSON and status' do
      expect(response).to have_json_attributes(id: 1, title: 'Hello').with_status(200)
    end
  end
end
```
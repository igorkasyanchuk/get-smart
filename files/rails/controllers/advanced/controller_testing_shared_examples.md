## 🧪 Controller Testing with Shared RSpec Examples
Avoid duplicating test code by extracting common request specs into shared examples. Parameterize the example group for different controllers or actions.

```ruby
# spec/support/shared_examples/crud_controller.rb
RSpec.shared_examples 'a CRUD controller' do |factory|
  let(:resource) { create(factory) }

  describe 'GET #show' do
    it 'returns the resource' do
      get :show, params: { id: resource.id }
      expect(response).to have_http_status(:ok)
    end
  end
end
```

Include in your controller spec:
```ruby
RSpec.describe ArticlesController, type: :controller do
  it_behaves_like 'a CRUD controller', :article
end
```
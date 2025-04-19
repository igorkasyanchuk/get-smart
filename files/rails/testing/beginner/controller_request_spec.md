## 🚦 Testing Controller Actions with Request Specs

Rails request specs let you simulate HTTP calls. Create a file under `spec/requests` and use `get`, `post`, etc., to test endpoints and responses.

```ruby
# spec/requests/articles_request_spec.rb
RSpec.describe "Articles", type: :request do
  describe "GET /articles" do
    it 'returns a successful response' do
      get '/articles'
      expect(response).to have_http_status(:ok)
    end
  end

  describe "POST /articles" do
    it 'creates a new article' do
      post '/articles', params: { article: { title: 'Hello', body: 'World' } }
      expect(response).to have_http_status(:created)
      expect(JSON.parse(response.body)['title']).to eq('Hello')
    end
  end
end
```
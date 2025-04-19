## 📚 Embed Usage Examples in README and Tests

Demonstrate how to use your gem directly in the `README.md` so users can copy‑paste working code. Use fenced code blocks with language annotation:

```markdown
```ruby
require "my_cool_gem"

client = MyCoolGem::Client.new(api_key: ENV["API_KEY"])
puts client.fetch_data("resource_id")
```
```

Also mirror these examples in your spec suite to catch regressions. For instance, create an integration spec:

```ruby
# spec/integration/usage_spec.rb
require "spec_helper"

RSpec.describe "Usage Examples" do
  it "fetches data from the API" do
    client = MyCoolGem::Client.new(api_key: "test_key")
    expect(client.fetch_data("123")).to be_a(Hash)
  end
end
```

This ensures your documentation stays accurate as the gem evolves.
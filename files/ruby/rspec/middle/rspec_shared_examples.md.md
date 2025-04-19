## 📦 Leveraging `shared_examples` for DRY Tests

Extract common behaviors with `shared_examples` or `shared_context` to avoid duplication across models or controllers. This keeps your specs concise and ensures consistency when testing similar interfaces. Use `it_behaves_like` within nested `describe` blocks to apply shared tests with custom parameters.

```ruby
# spec/support/shared_examples/trackable.rb
shared_examples "a trackable resource" do |factory|
  let(:resource) { create(factory) }

  it "increments change log" do
    expect { resource.track! }.to change { resource.logs.count }.by(1)
  end
end

# Usage in model spec
describe Post, type: :model do
  it_behaves_like "a trackable resource", :post
end
```
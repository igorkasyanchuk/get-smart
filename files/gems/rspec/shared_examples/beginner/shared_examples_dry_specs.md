## 🧩 Use shared_examples for DRY Specs

When you have similar examples across multiple specs, `shared_examples` helps DRY up your tests by extracting common behaviors. Define your shared examples once and reuse them with `it_behaves_like`, keeping your test suite concise and maintainable.

```ruby
RSpec.shared_examples "a writable model" do
  it "responds to #write" do
    expect(subject).to respond_to(:write)
  end
end

RSpec.describe Document do
  subject { described_class.new }

  it_behaves_like "a writable model"
end

RSpec.describe FileEntry do
  subject { described_class.new }

  it_behaves_like "a writable model"
end
```

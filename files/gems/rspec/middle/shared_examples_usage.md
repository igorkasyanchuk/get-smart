## 🔗 Shared Examples

Shared examples let you DRY up repeated behavior across multiple specs by defining a template of tests. Use `shared_examples` and `it_behaves_like` to include those tests in different contexts or describe blocks.

```ruby
RSpec.shared_examples "a pinger" do
  it "replies with pong" do
    expect(subject.ping).to eq('pong')
  end
end

RSpec.describe ServiceA do
  subject { ServiceA.new }
  it_behaves_like "a pinger"
end

RSpec.describe ServiceB do
  subject { ServiceB.new }
  it_behaves_like "a pinger"
end
```

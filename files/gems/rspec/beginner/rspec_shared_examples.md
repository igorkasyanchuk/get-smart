## 🔄 Sharing Behavior with shared_examples

Use `shared_examples` to define common tests that can be reused across multiple contexts. This avoids duplication when you're testing similar behavior in different classes.

```ruby
RSpec.shared_examples 'a timestamped model' do
  it 'has created_at set' do
    expect(record.created_at).not_to be_nil
  end
end

RSpec.describe Post do
  let(:record) { Post.create }
  it_behaves_like 'a timestamped model'
end
```

## 🔁 Reuse Tests with `shared_examples`

When multiple models or controllers share behavior, use `shared_examples` to avoid duplication. Define the shared examples once, then include them with `it_behaves_like` or `it_should_behave_like` in any spec.

```ruby
# spec/support/shared/commentable_examples.rb
RSpec.shared_examples "a commentable" do
  it 'allows creating comments' do
    commentable = described_class.create!
    comment = commentable.comments.create(body: 'Nice!')
    expect(commentable.comments).to include(comment)
  end
end

# spec/models/post_spec.rb
describe Post, type: :model do
  it_behaves_like "a commentable"
end

# spec/models/event_spec.rb
describe Event, type: :model do
  it_behaves_like "a commentable"
end
```

## 🧩 Use shared_examples to DRY common specs

When your specs contain repeated examples, extract them using `shared_examples` to DRY up tests and improve maintainability. Define shared behavior once and reuse it across multiple describe blocks.

```ruby
# spec/support/shared_examples/user_validations.rb
RSpec.shared_examples "a user with basic validations" do
  it "is invalid without an email" do
    subject.email = nil
    expect(subject).not_to be_valid
  end

  it "is invalid without a password" do
    subject.password = nil
    expect(subject).not_to be_valid
  end
end

# spec/models/admin_spec.rb
RSpec.describe Admin, type: :model do
  subject { build(:admin) }
  it_behaves_like "a user with basic validations"
end
```

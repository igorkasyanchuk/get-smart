## 🧪 Tip: Skipping Callbacks in Tests

During testing, callbacks can slow tests or introduce unwanted side effects. Use `skip_callback` and `set_callback` in `before`/`after` hooks to temporarily disable them.

```ruby
RSpec.describe User, type: :model do
  before(:all) do
    User.skip_callback(:create, :after, :send_welcome_email)
  end

  after(:all) do
    User.set_callback(:create, :after, :send_welcome_email)
  end

  it 'creates user without sending email' do
    expect { User.create!(email: 'a@b.com') }.not_to change(ActionMailer::Base.deliveries, :size)
  end
end
```

This approach keeps your test suite fast and focused on the unit under test.
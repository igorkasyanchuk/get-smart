## 🧪 Test Callbacks in Isolation
When testing models, stub or expect callback methods directly to ensure they’re invoked without relying on side-effects.

```ruby
RSpec.describe User, type: :model do
  describe 'callbacks' do
    it 'normalizes email on save' do
      user = build(:user, email: ' Foo@Bar.COM ')
      expect(user).to receive(:normalize_email)
      user.save
    end
  end
end
```

This test verifies the callback method runs, isolating behavior and avoiding actual database mutations or external calls.
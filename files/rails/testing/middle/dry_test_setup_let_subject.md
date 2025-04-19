## 🎭 DRY Test Setup with `let` and `subject`

Use `let` to lazily define variables and `subject` to declare the primary object under test. This keeps your setup DRY and focused only on what each example needs. Because `let` is memoized per example, it helps avoid unexpected side effects between tests.

```ruby
# spec/models/user_spec.rb
describe User, type: :model do
  subject(:user) { build(:user, admin: is_admin) }
  let(:is_admin) { true }

  it 'is an admin if flagged' do
    expect(user).to be_admin
  end

  context 'when not flagged' do
    let(:is_admin) { false }

    it 'is not an admin' do
      expect(user).not_to be_admin
    end
  end
end
```

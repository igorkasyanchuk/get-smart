## 🧪 Testing Model Validations

Ensure your models enforce data integrity by writing validation specs. Create a file under `spec/models` and test both valid and invalid cases.

```ruby
# spec/models/user_spec.rb
RSpec.describe User, type: :model do
  it 'is valid with valid attributes' do
    user = User.new(name: 'Jane', email: 'jane@example.com')
    expect(user).to be_valid
  end

  it 'is invalid without an email' do
    user = User.new(name: 'Jane', email: nil)
    expect(user).not_to be_valid
    expect(user.errors[:email]).to include("can't be blank")
  end
end
```
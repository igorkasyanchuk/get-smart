## 🏭 Simplifying Test Data with FactoryBot

FactoryBot helps you generate test data more flexibly than fixtures. Add the gem, configure, then define factories under `spec/factories`.

```ruby
gem 'factory_bot_rails', '~> 6.0', group: :test
```

```ruby
# spec/factories/users.rb
FactoryBot.define do
  factory :user do
    name { 'Factory User' }
    email { 'factory@example.com' }
  end
end
```

Use it in specs:

```ruby
RSpec.describe User, type: :model do
  it 'builds a valid user' do
    user = build(:user)
    expect(user).to be_valid
  end

  it 'persists a user' do
    expect { create(:user) }.to change(User, :count).by(1)
  end
end
```
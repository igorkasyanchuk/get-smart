## 🧪 Use Faker in Your Tests

Integrate Faker into your test suite to generate dynamic, realistic data for factories or fixtures. This reduces brittle tests and keeps test data varied.

```ruby
# spec/factories/users.rb
FactoryBot.define do
  factory :user do
    name     { Faker::Name.name }
    email    { Faker::Internet.unique.safe_email }
    password { 'password' }
  end
end
```

Then in your spec:

```ruby
RSpec.describe User, type: :model do
  it 'has a valid factory' do
    expect(build(:user)).to be_valid
  end
end
```

## 🚀 Leverage Sequences for Unique Attributes

Sequences are perfect for generating unique values in attributes like emails or identifiers. They increment on each use, ensuring you never hit a uniqueness validation error in tests.

```ruby
# spec/factories/users.rb
FactoryBot.define do
  factory :user do
    sequence(:email) { |n| "user#{n}@example.com" }
    password { "password123" }
  end
end

# Usage in specs
user1 = create(:user)         # email => "user1@example.com"
user2 = create(:user)         # email => "user2@example.com"
```
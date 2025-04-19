## 🏭 Integrating Faker into FactoryBot Definitions

FactoryBot pairs seamlessly with Faker for generating realistic test records. Use lazy attributes (blocks) to ensure each build or create call is fresh, and combine `unique` where necessary. Transient attributes allow you to parametrize your factories further.

```ruby
FactoryBot.define do
  factory :user do
    name  { Faker::Name.name }
    email { Faker::Internet.unique.email }
    bio   { Faker::Lorem.sentence(word_count: 10) }
  end
end

# Usage in your specs:
user1 = create(:user)
user2 = create(:user)
# Both users will have different emails, names, and bios.
```
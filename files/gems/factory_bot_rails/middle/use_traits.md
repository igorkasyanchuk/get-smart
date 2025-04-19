## 🎨 Use Traits for DRY Factory Definitions

Traits allow you to encapsulate variations of a factory in a modular way, reducing duplication and making your specs easier to read. Define common configurable traits and then combine them when building or creating records.

```ruby
# spec/factories/users.rb
FactoryBot.define do
  factory :user do
    name { "John Doe" }
    email { "user@example.com" }

    trait :admin do
      role { :admin }
    end

    trait :with_profile do
      after(:build) do |user|
        user.profile ||= build(:profile, user: user)
      end
    end
  end
end

# Usage in specs
admin_with_profile = create(:user, :admin, :with_profile)
```
## 🚀 Master Transient Attributes and Traits for Dynamic Associations

When you need factories that adapt their associated records at runtime, transient attributes combined with traits are your go‑to tools. Transient attributes let you pass in parameters without persisting them, while traits allow grouping of related behavior. This pattern is invaluable for complex domain models (e.g., users with variable numbers of orders or structures with nested children).

```ruby
FactoryBot.define do
  factory :user do
    name { Faker::Name.name }
    transient do
      orders_count { 3 }
      with_profile { true }
    end

    trait :with_orders do
      after(:create) do |user, evaluator|
        create_list(:order, evaluator.orders_count, user: user)
      end
    end

    trait :without_profile do
      after(:build) { |user| user.profile = nil }
    end

    after(:create) do |user, evaluator|
      if evaluator.with_profile
        create(:profile, user: user)
      end
    end
  end
end

# Usage examples:
create(:user, :with_orders, orders_count: 5, with_profile: false)
# => user with 5 orders but no profile

create(:user, with_profile: true)
# => user with default 3 orders and a profile
```

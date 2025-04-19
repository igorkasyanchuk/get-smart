## 🏷️ Leverage Traits to DRY Up Factories

Traits let you group sets of attributes that can be reused across tests. This reduces duplication when you need similar variations of a model. Define a trait inside your factory and pass its name when creating instances.

```ruby
# spec/factories/users.rb
FactoryBot.define do
  factory :user do
    name  { "Jane Doe" }
    email { "jane.doe@example.com" }

    trait :admin do
      role { "admin" }
    end

    trait :guest do
      role { "guest" }
    end
  end
end
```

Use traits in specs:

```ruby
admin_user = create(:user, :admin)
guest_user = create(:user, :guest)
```
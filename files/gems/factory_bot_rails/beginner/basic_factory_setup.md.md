## 🎲 Define a Basic Factory

Factories are blueprints for test data in FactoryBot. Start by creating a factory in `spec/factories`, specifying default attributes for your model. You can then use `build` or `create` in your specs to generate instances easily.

```ruby
# spec/factories/users.rb
FactoryBot.define do
  factory :user do
    name  { "John Doe" }
    email { "john.doe@example.com" }
  end
end
```

Use in tests:

```ruby
# build does not persist to the database
test_user = build(:user)

# create saves the record to the database
persisted_user = create(:user)
```

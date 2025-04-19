## 🌱 Generate Seed Data with Faker

Use Faker in `db/seeds.rb` to populate your database with realistic dummy data. This helps you test UI and features without manually creating records.

```ruby
# db/seeds.rb
10.times do
  User.create(
    name:     Faker::Name.name,
    email:    Faker::Internet.unique.email,
    password: 'password'
  )
end

# Then run:
# $ rails db:seed
```

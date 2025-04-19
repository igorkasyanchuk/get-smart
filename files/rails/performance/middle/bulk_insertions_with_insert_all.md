## ⚡ Bulk Insertions with `insert_all`

Insert thousands of records in a single query without ActiveRecord callbacks or validations. Ideal for seeding or importing CSV data.

```ruby
users = (1..5000).map do |i|
  { name: "User #{i}", created_at: Time.current, updated_at: Time.current }
end
User.insert_all(users)
```

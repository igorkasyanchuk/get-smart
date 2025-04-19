## 💡 Customize to_json for Selective Attributes

Rails’ built‑in `to_json` lets you filter out sensitive fields and include related objects without writing manual loops. You can pass `:only`, `:except` and `:include` options to tailor the JSON payload to your API’s needs.

```ruby
# Fetch a user and only serialize id, name, email, and their posts' titles
user = User.find(1)
json = user.to_json(
  only: [:id, :name, :email],
  include: {
    posts: { only: [:id, :title] }
  }
)
puts json
```
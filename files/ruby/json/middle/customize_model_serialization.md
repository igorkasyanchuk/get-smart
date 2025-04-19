## 🎨 Customize Rails Model JSON with as_json and to_json
Rails’ `as_json` and `to_json` methods let you fine‑tune how your ActiveRecord objects are serialized. Use the `only`, `except`, `methods`, and `include` options to shape payloads precisely for your API consumers.

```ruby
class User < ApplicationRecord
  def as_json(options = {})
    super(
      only: [:id, :name, :email],         # include only these attributes
      methods: [:full_name],               # include custom method
      include: {                           # nest associated models
        posts: { only: [:id, :title] }
      }
    )
  end

  def full_name
    "#{first_name} #{last_name}"
  end
end

# Controller usage
render json: @user, status: :ok
```

By overriding `as_json`, you ensure consistent serialization across calls and can avoid leaking sensitive fields.
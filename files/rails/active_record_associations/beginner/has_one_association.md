## 🌱 Use `has_one` for Single Associations

When a model should have exactly one of another model, use `has_one`. It sets up getter and setter methods similar to `belongs_to` but on the parent side.

```ruby
# app/models/user.rb
class User < ApplicationRecord
  has_one :profile
end
```

You can call `user.profile` to fetch the profile or `user.build_profile(bio: "Hello")` to instantiate a new one linked to the user.

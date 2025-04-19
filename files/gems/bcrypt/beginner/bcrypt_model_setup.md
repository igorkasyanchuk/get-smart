## 🛠️ Use has_secure_password in your User model

Rails provides the `has_secure_password` helper which wraps bcrypt for you. First, generate a migration to add a `password_digest` column and then declare `has_secure_password` in your model.

```bash
$ rails generate migration AddPasswordDigestToUsers password_digest:string
$ rails db:migrate
```

```ruby
# app/models/user.rb
class User < ApplicationRecord
  has_secure_password
end
```

This gives you `password` and `password_confirmation` attributes, as well as a `authenticate` method out of the box.

## 🔑 Use `has_secure_password` for User Model

Rails provides a quick way to handle password hashing with the `bcrypt` gem. By adding `has_secure_password` to your `User` model, Rails will automatically add virtual `password` and `password_confirmation` attributes and handle validation and authentication methods for you.

1. Add `bcrypt` to your Gemfile and run `bundle install`.

```ruby
# Gemfile
gem 'bcrypt', '~> 3.1.7'
```

2. Generate a migration to add the `password_digest` column to users.

```ruby
rails generate migration AddPasswordDigestToUsers password_digest:string
rails db:migrate
```

3. Update your `User` model.

```ruby
class User < ApplicationRecord
  has_secure_password
end
```

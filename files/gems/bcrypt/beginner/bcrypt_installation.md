## 🔒 Install and configure bcrypt gem

bcrypt is a popular library for securely hashing passwords. To get started, add it to your Gemfile and run bundle to install. This ensures all your password operations use a proven hashing algorithm.

```ruby
# Gemfile
gem 'bcrypt', '~> 3.1.7'
```

```bash
$ bundle install
```

After installing, restart your Rails server so the gem is loaded properly.

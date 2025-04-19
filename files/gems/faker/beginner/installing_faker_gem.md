## 📦 Install and Configure Faker

To start using Faker, add it to your Gemfile under the `development` and `test` groups so it's only loaded where needed. After running `bundle install`, require it in your Rails project to ensure it's available.

```ruby
group :development, :test do
  gem 'faker'
end

# Then run:
# $ bundle install
```

## 🧹 Remove Debug Gems in Production
Ensure debugging tools like `byebug` or `pry` are only in development and test groups to avoid exposing internals.

```ruby
# Gemfile
group :development, :test do
  gem 'pry'
  gem 'byebug'
end
group :production do
  # no debug gems here
end
```
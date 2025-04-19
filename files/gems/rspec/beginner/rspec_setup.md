## 📦 Installing and Configuring RSpec

To get started with RSpec in a Rails project, add the `rspec-rails` gem to your `Gemfile` and run the installer. This will generate the necessary spec directory and configuration files automatically.

```ruby
group :development, :test do
  gem 'rspec-rails', '~> 5.0'
end
```

Then run:

```bash
bundle install
rails generate rspec:install
```

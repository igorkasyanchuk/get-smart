## 🛠️ Setting Up RSpec

RSpec is a popular testing framework for Rails. To get started, add the `rspec-rails` gem to your `:development, :test` group and install it.

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

This creates the `spec/` directory and configures RSpec so you can begin writing specs right away.
## 🚀 Use Oj for High‑Performance JSON Serialization

Oj is a C‑based JSON library optimized for speed and low memory. By configuring it as Rails’ default encoder/decoder, you’ll see big gains when rendering large or nested Ruby objects.

```ruby
# Add to Gemfile
gem 'oj'

# Then in config/initializers/oj.rb
require 'oj'
Oj.optimize_rails

# Now ActiveSupport JSON uses Oj under the hood
data = { users: User.all.as_json }
puts data.to_json
```
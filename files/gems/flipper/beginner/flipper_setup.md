## 🔧 Setting Up Flipper in Rails
Before using Flipper, add it to your Gemfile and configure an adapter. This lets you start defining and toggling features right away.

```ruby
# Gemfile
gem 'flipper'
gem 'flipper-ui'

# Run in terminal:
bundle install

# config/initializers/flipper.rb
require 'flipper'

# Choose an adapter (Memory, ActiveRecord, Redis, etc.)
adapter = Flipper::Adapters::Memory.new
$flipper = Flipper.new(adapter)

# Mount the UI to inspect flags:
# config/routes.rb
mount Flipper::UI.app($flipper), at: '/flipper'
```
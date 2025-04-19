## ⚙️ Customize Rails Generators

By default, Rails generators create helper, asset, and test files you may not need. You can disable them to keep your project lean.

```ruby
# config/application.rb
module MyApp
  class Application < Rails::Application
    config.generators do |g|
      g.helper false       # skip generating helper files
      g.assets false       # skip CSS/JS assets
      g.test_framework :rspec, fixtures: false # use RSpec without fixtures
    end
  end
end
```

This reduces clutter, speeds up generation, and keeps your codebase focused only on files you actually use.
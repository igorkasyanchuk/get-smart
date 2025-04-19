## 🛠️ TestProf FactoryDoctor Integration
Integrate TestProf’s FactoryDoctor to detect and report slow or duplicated factory usage, slashing build times by highlighting wasted database calls before they hit your CI.

```ruby
# Gemfile:
gem 'test_prof', require: false

# spec/spec_helper.rb
require 'test_prof'
TestProf::FactoryDoctor.configure do |config|
  config.strategy = :pluck # or :tear_down for full cleanup
  config.threshold = 50    # warn when >50 factories per example
end
TestProf::FactoryDoctor.start

# Run your specs and review the FactoryDoctor report for hotspots:
# [FactoryDoctor] example "creates a user with posts" built 75 factories (> threshold)
```
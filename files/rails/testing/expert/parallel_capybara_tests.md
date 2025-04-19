## 🎭 Run Parallel Capybara System Tests with Headless Chrome

Scale your system specs by running multiple headless Chrome sessions in parallel. Combine **parallel_tests** with proper DB-cleaning to cut build times significantly.

```ruby
# Gemfile
group :test do
  gem 'parallel_tests'
  gem 'database_cleaner-active_record'
end
```

```ruby
# spec/spec_helper.rb
require 'parallel_tests'
require 'database_cleaner/active_record'

RSpec.configure do |config|
  config.use_transactional_fixtures = false

  config.before(:suite) do
    DatabaseCleaner.strategy = :truncation
  end

  config.before(:each) do
    DatabaseCleaner.start
  end

  config.after(:each) do
    DatabaseCleaner.clean
  end
end

Capybara.register_driver :chrome_headless do |app|
  caps = Selenium::WebDriver::Remote::Capabilities.chrome(
    chromeOptions: { args: %w[headless disable-gpu no-sandbox window-size=1400,1400] }
  )
  Capybara::Selenium::Driver.new(app, browser: :chrome, desired_capabilities: caps)
end
Capybara.javascript_driver = :chrome_headless
```

Execute:

```bash
bundle exec parallel_rspec spec/system -n 4 --serialize-stdout
```

Adjust `-n` to your CPU count and watch your system suite finish in minutes, not hours.
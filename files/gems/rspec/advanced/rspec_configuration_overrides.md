## ⚙️ Override RSpec Configuration at Runtime

Sometimes you need to tweak RSpec settings for a subset of your suite, such as enabling color or custom formatters only for certain directories. You can override configuration within example groups by using `RSpec.describe` metadata hooks. This preserves global defaults while allowing local adjustments.

```ruby
# spec/special/spec_helper_override.rb
RSpec.configure do |config|
  config.add_formatter('documentation') if ENV['VERBOSE_SPECS']
end

# In a spec file
tags = { verbose: true }
RSpec.describe 'Special cases', tags do
  around do |example|
    RSpec.configuration.color = false
    example.run
    RSpec.configuration.color = true
  end

  it 'runs without color' do
    expect(true).to be_truthy
  end
end
```
## 🎞️ Dynamic VCR Cassettes
Automate cassette naming using RSpec metadata and dynamic interpolation to avoid manual discrepancies and group recordings logically by example or feature flag.

```ruby
# spec/support/vcr.rb
VCR.configure do |c|
  c.cassette_library_dir = 'spec/vcr_cassettes'
  c.hook_into :webmock
end

RSpec.configure do |config|
  config.around(:each, :vcr) do |example|
    name = example.metadata[:cassette] || example.full_description.underscore.tr(' ', '/')
    VCR.use_cassette(name, record: :new_episodes) { example.run }
  end
end

# Usage in specs:
# it 'fetches data', :vcr do
#   # uses cassettes/spec_fetches_data.yml
# end
```
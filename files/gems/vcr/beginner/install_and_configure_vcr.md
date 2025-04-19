## 🛠️ Install and Configure VCR

VCR records your HTTP interactions to cassette files so you can replay them in tests without hitting real services. Start by adding the `vcr` and `webmock` gems to your `Gemfile` and running `bundle install`. Then configure VCR in your `spec_helper.rb` or `rails_helper.rb` to set the cassette directory and hook into WebMock.

```ruby
# spec/spec_helper.rb
require 'vcr'
require 'webmock/rspec'

VCR.configure do |config|
  config.cassette_library_dir = 'spec/vcr_cassettes'  # where cassettes are stored
  config.hook_into :webmock                         # intercept HTTP with WebMock
  config.configure_rspec_metadata!                  # enable `:vcr` metadata for RSpec
end
```
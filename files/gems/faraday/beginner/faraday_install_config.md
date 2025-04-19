## 🛠️ Installing and Configuring Faraday

Faraday is a flexible HTTP client library for Ruby that supports middleware stacking. To begin, add the gem and a JSON middleware to your Gemfile, then create a connection object to handle requests and responses uniformly.

```ruby
# Gemfile
gem 'faraday'
gem 'faraday_middleware'
```

```ruby
# config/initializers/faraday.rb
require 'faraday'
require 'faraday_middleware'

conn = Faraday.new(url: 'https://api.example.com') do |f|
  f.request  :url_encoded                # form-encode POST params
  f.response :logger, nil, { headers: true, bodies: true }  # log requests & responses
  f.response :json, content_type: /
/             # parse JSON responses automatically
  f.adapter  Faraday.default_adapter     # choose Net::HTTP or other adapters
end
```

This setup ensures your HTTP requests are encoded properly, logged for debugging, and JSON responses are parsed into Ruby hashes without extra effort. You can now reuse `conn` across your application to keep code DRY.
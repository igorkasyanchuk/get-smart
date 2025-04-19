## ⚙️ Custom HMAC Authentication Middleware

For advanced security in Faraday, you can implement custom middleware to sign each request with HMAC instead of relying on external gems. This allows you to insert your own logic before the request is sent, compute signatures on headers or body, and ensure consistency across services.

```ruby
# lib/faraday/middleware/hmac_auth.rb
require 'openssl'

module Faraday
  class HmacAuth < Faraday::Middleware
    def initialize(app, api_key:, secret:)
      super(app)
      @api_key = api_key
      @secret  = secret
    end

    def call(env)
      timestamp = Time.now.to_i.to_s
      signature = OpenSSL::HMAC.hexdigest('SHA256', @secret, env.body.to_s + timestamp)

      env.request_headers['X-Api-Key']    = @api_key
      env.request_headers['X-Signature']  = signature
      env.request_headers['X-Timestamp']  = timestamp

      @app.call(env)
    end
  end
end

# Configuration in your client setup
connection = Faraday.new('https://api.example.com') do |f|
  f.request :url_encoded
  f.use Faraday::HmacAuth, api_key: ENV['API_KEY'], secret: ENV['API_SECRET']
  f.adapter :net_http
end
```
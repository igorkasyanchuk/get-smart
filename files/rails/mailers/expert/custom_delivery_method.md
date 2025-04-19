## 🎯 Implementing a Custom Delivery Method

Hook into `ActionMailer::Base.add_delivery_method` to integrate proprietary SMTP servers or APIs. This allows you to override `deliver!` semantics entirely.

```ruby
# lib/delivery_methods/my_api.rb
require 'net/http'
module DeliveryMethods
  class MyApi
    def initialize(settings)
      @api_key = settings[:api_key]
    end

    def deliver!(mail)
      payload = {
        to: mail.to,
        subject: mail.subject,
        body: mail.body.decoded
      }
      uri = URI.parse("https://api.example.com/send_email")
      req = Net::HTTP::Post.new(uri)
      req['Authorization'] = "Bearer #{@api_key}"
      req.body = payload.to_json
      Net::HTTP.start(uri.hostname, uri.port, use_ssl: true) { |http| http.request(req) }
    end
  end
end

# config/initializers/mailer.rb
ActionMailer::Base.add_delivery_method :my_api, DeliveryMethods::MyApi, api_key: Rails.application.credentials.email_api_key
ActionMailer::Base.delivery_method = :my_api
```

This pattern decouples Rails from vendor SDKs and gives you full control over error handling and retries.
## 🔌 Custom Delivery Method Integration
Implement a custom delivery method to integrate with third-party APIs or specialized SMTP services. Create a Ruby class responding to `deliver!` and register it in `config.action_mailer`.

```ruby
# lib/mailers/delivery/postmark_client.rb
module Mailers
  module Delivery
    class PostmarkClient
      def initialize(values);
        @values = values
      end

      def deliver!
        Postmark::ApiClient.new(ENV['POSTMARK_API_TOKEN'])
          .deliver(@values)
      end
    end
  end
end

# config/environments/production.rb
Rails.application.configure do
  config.action_mailer.delivery_method = :postmark_client
  config.action_mailer.postmark_client_settings = {}
end
```
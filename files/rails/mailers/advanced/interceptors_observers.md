## 🚧 Using Interceptors and Observers
Leverage `Mail::Interceptor` to modify outgoing emails globally, e.g., stamp footers or reroute to a test inbox in non-production environments.

```ruby
# config/initializers/mail_interceptor.rb
class FooterInterceptor
  def self.delivering_email(mail)
    mail.body = "\n--\nCompany Footer" + mail.body.raw_source
  end
end

Mail.register_interceptor(FooterInterceptor)

# To observe deliveries:
class DeliveryObserver
  def self.delivered_email(mail)
    Rails.logger.info "Email sent to: #{mail.to} -- Subject: #{mail.subject}"
  end
end

Mail.register_observer(DeliveryObserver)
```
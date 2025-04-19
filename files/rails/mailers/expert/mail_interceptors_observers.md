## 🔍 Global Mail Interceptors and Observers

Use `ActionMailer::Interceptor` and `Observer` to inject headers, enforce policies, or audit outgoing mails. Interceptors run before delivery; observers run after.

```ruby
# app/interceptors/add_tracking_header.rb
class AddTrackingHeader
  def self.delivering_email(mail)
    mail.header['X-Tracking-ID'] = SecureRandom.uuid
  end
end

# app/observers/email_audit_observer.rb
class EmailAuditObserver
  def self.delivered_email(mail)
    AuditLog.create!(
      to: mail.to,
      subject: mail.subject,
      message_id: mail.message_id,
      delivered_at: Time.current
    )
  end
end

# config/initializers/mail.rb
ActionMailer::Base.register_interceptor(AddTrackingHeader)
ActionMailer::Base.register_observer(EmailAuditObserver)
```

By combining both, you can mutate outbound messages and capture metadata for compliance and analytics.
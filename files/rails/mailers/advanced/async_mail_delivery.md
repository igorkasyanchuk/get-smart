## 🚀 Async Mail Delivery with ActiveJob
By default, Rails sends emails synchronously, which can slow down response times. You can offload mail delivery to background jobs by configuring your mailer to use ActiveJob. This allows retry logic and job priorities for more reliable delivery.

```ruby
# app/mailers/user_mailer.rb
class UserMailer < ApplicationMailer
  # Enqueue mail delivery instead of delivering inline
  self.deliver_later_queue_name = :mailers

  def welcome_email(user_id)
    @user = User.find(user_id)
    mail(to: @user.email, subject: 'Welcome!')
  end
end

# Sending the email asynchronously
UserMailer.with(user_id: current_user.id).welcome_email.deliver_later
```
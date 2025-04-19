## ✉️ Setting Default Options

You can set default headers such as `from`, `reply_to`, or a template layout once in your mailer class. This reduces repetition across multiple mailer methods.

```ruby
# app/mailers/user_mailer.rb
class UserMailer < ApplicationMailer
  default from: 'no-reply@example.com', reply_to: 'support@example.com'
  layout 'mailer'

  def welcome_email(user)
    @user = user
    mail(to: @user.email, subject: 'Welcome to My App')
  end
end
```

Here, every email sent by `UserMailer` will use the specified `from` address and layout unless overridden in individual methods.
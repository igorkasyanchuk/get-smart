## 🛠️ Leverage View Helpers in Mailers

You can include your view helpers or custom methods in mailers for consistent formatting of data. Simply include or delegate them in your mailer class.

```ruby
# app/mailers/application_mailer.rb
class ApplicationMailer < ActionMailer::Base
  helper ApplicationHelper  # includes all methods from app/helpers/application_helper.rb
  default from: 'no-reply@example.com'
  layout 'mailer'
end
```

```erb
<!-- app/views/user_mailer/notification.html.erb -->
<p>Your balance is <%= number_to_currency(@user.balance) %>.</p>
```
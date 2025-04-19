## 🎨 Customize Mailer Layouts

By default, Rails mailers use `app/views/layouts/mailer.html.erb`. You can define custom layouts per mailer or per action to share wrapping styles and partials across emails. This helps maintain consistent branding and DRY up your templates.

```ruby
# app/mailers/user_mailer.rb
class UserMailer < ApplicationMailer
  layout 'notification'  # uses app/views/layouts/notification.html.erb

  def welcome_email(user)
    @user = user
    mail(to: @user.email, subject: 'Welcome!')
  end
end
```

You can even specify a layout per action:

```ruby
class UserMailer < ApplicationMailer
  layout :choose_layout

  private

  def choose_layout
    action_name == 'alert' ? 'alert_layout' : 'mailer'
  end
end
```
## 📧 Reusing Helpers in Mailers
Leverage view helpers inside Action Mailers by including them or using the controller renderer. This allows you to share formatting, URL helpers, or partial rendering logic between your views and emails.

```ruby
# app/mailers/user_mailer.rb
class UserMailer < ApplicationMailer
  helper :application       # brings in ApplicationHelper
  helper NavigationHelper   # bring in custom helpers

  def welcome_email(user)
    @user = user
    mail(to: user.email, subject: "Welcome!")
  end
end
```

Or use `ApplicationController.renderer` for fully rendered partials:

```ruby
ApplicationController.renderer.render(partial: 'users/welcome', assigns: { user: @user })
```
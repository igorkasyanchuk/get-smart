## 📨 Defining Mailer Methods with Templates

Each public method in your mailer becomes an email action and should set instance variables for use in views. Create matching view files in `app/views/your_mailer_name/`.

```ruby
# app/mailers/user_mailer.rb
class UserMailer < ApplicationMailer
  def reset_password(user, token)
    @user = user
    @token = token
    mail(to: @user.email, subject: 'Reset Your Password')
  end
end
```

Then add templates:

```erb
<!-- app/views/user_mailer/reset_password.html.erb -->
<p>Hello <%= @user.name %>,</p>
<p>Click <a href="<%= edit_password_url(token: @token) %>">here</a> to reset your password.</p>
```
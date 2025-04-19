## 🔧 Sending Emails from Controllers

You can invoke mailer methods directly in your controllers and choose whether to send emails synchronously (`deliver_now`) or asynchronously (`deliver_later`).

```ruby
# app/controllers/users_controller.rb
class UsersController < ApplicationController
  def create
    @user = User.create(user_params)
    if @user.persisted?
      UserMailer.welcome_email(@user).deliver_now
      redirect_to root_path, notice: 'Welcome email sent.'
    else
      render :new
    end
  end
end
```

Use `deliver_now` for immediate sending; this blocks the request until the email is delivered.
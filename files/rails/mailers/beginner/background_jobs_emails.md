## 🛠️ Using Background Jobs to Send Emails

To avoid slowing down user requests, leverage Active Job with `deliver_later`. This enqueues the email to be sent by your configured queue adapter.

```ruby
# app/controllers/users_controller.rb
class UsersController < ApplicationController
  def create
    @user = User.create(user_params)
    if @user.persisted?
      UserMailer.welcome_email(@user).deliver_later
      redirect_to root_path, notice: 'Welcome email will be sent shortly.'
    else
      render :new
    end
  end
end
```

Make sure you have a queue adapter set in `config/application.rb` or respective environment files.
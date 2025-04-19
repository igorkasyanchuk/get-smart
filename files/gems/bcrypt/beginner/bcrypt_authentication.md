## 🔍 Verify passwords and handle authentication

After setting up `has_secure_password`, you can authenticate users by calling the `authenticate` method on the model. This returns the user if the password matches, or `false` otherwise.

```ruby
# app/controllers/sessions_controller.rb
class SessionsController < ApplicationController
  def create
    user = User.find_by(email: params[:email])
    if user&.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to dashboard_path, notice: 'Logged in successfully.'
    else
      flash.now[:alert] = 'Invalid email or password'
      render :new
    end
  end
end
```

Ensure you never store plain-text passwords and always use `authenticate` to compare safely.

## 🔑 Using Sessions to Store User Data

Sessions let you persist small bits of data (like a user ID) between requests without manually handling cookies. In Rails, you can assign or read session values via the `session` hash in your controller. This is perfect for things like keeping track of a logged‑in user.

```ruby
class ApplicationController < ActionController::Base
  def create
    user = User.find_by(email: params[:email])
    if user&.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to dashboard_path, notice: "Logged in!"
    else
      render :new, alert: "Invalid login"
    end
  end

  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end
end
```
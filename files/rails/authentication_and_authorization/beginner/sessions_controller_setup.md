## 🔒 Create `SessionsController` for Login/Logout

A sessions controller is the conventional way to manage user login and logout. You will handle setting and clearing the `session[:user_id]` to track signed‐in users.

1. Generate the controller:

```bash
rails generate controller Sessions new create destroy
```

2. Implement login and logout actions:

```ruby
class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:email])
    if user&.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to root_path, notice: 'Logged in successfully'
    else
      flash.now[:alert] = 'Invalid email or password'
      render :new
    end
  end

  def destroy
    session.delete(:user_id)
    redirect_to login_path, notice: 'Logged out successfully'
  end
end
```

3. Add routes:

```ruby
# config/routes.rb
get 'login', to: 'sessions#new'
post 'login', to: 'sessions#create'
delete 'logout', to: 'sessions#destroy'
```
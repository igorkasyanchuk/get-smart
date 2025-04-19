## 🔒 Use Strong Parameters

Always whitelist parameters in controllers to prevent mass assignment vulnerabilities. Using `require` and `permit` ensures only allowed attributes are saved.

```ruby
# app/controllers/users_controller.rb
class UsersController < ApplicationController
  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to @user
    else
      render :new
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :name)
  end
end
```

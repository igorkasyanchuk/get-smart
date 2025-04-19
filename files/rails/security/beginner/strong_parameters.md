## 🛡️ Use Strong Parameters
Prevent unwanted mass assignment by whitelisting allowed parameters in controllers. Define a private method that requires and permits only safe attributes.

```ruby
class UsersController < ApplicationController
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
```

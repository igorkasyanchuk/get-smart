## 🐞 Use Byebug for Step-by-Step Debugging

Byebug lets you pause execution at any point and inspect the current state of your Rails app. Insert `byebug` into controllers, models, or jobs to step through lines, inspect variables, and evaluate expressions on the fly. This approach is invaluable when you need to understand control flow or state changes in complex actions.

```ruby
# app/controllers/users_controller.rb
class UsersController < ApplicationController
  def create
    @user = User.new(user_params)
    byebug  # Execution will stop here
    if @user.save
      redirect_to @user
    else
      render :new
    end
  end
end
```

Once execution stops, you can use commands like `next`, `step`, `list`, and `continue` to navigate your code.
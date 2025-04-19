## 🎛️ Logging in Controllers
Controllers are a common place to add logs for incoming requests and important actions. Place log calls at key points to trace application flow.

```ruby
class UsersController < ApplicationController
  def show
    Rails.logger.info "Fetching user with ID=#{params[:id]}"
    @user = User.find(params[:id])
    Rails.logger.debug "Loaded user: #{@user.inspect}"
  end
end
```

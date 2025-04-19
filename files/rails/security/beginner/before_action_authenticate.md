## 🗂️ Require Authentication in Controllers
Ensure only logged-in users can access certain actions. Define a `before_action` callback to redirect unauthorized requests.

```ruby
class DashboardController < ApplicationController
  before_action :require_login

  private

  def require_login
    redirect_to login_path unless session[:user_id]
  end
end
```

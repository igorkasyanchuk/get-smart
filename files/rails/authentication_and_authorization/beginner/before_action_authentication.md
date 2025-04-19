## 🛡️ Protect Routes with `before_action`

Use a `before_action` filter in your controllers to ensure only authenticated users can access certain actions. Define a helper in `ApplicationController` and apply it where needed.

1. Define the helper methods:

```ruby
class ApplicationController < ActionController::Base
  helper_method :current_user, :logged_in?

  def current_user
    @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
  end

  def logged_in?
    current_user.present?
  end

  def require_login
    unless logged_in?
      redirect_to login_path, alert: 'Please log in to continue'
    end
  end
end
```

2. Apply the filter in any controller:

```ruby
class ArticlesController < ApplicationController
  before_action :require_login, only: [:new, :create, :edit, :update, :destroy]
end
```
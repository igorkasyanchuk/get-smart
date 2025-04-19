## 🔧 Install and Set Up Pundit

Add Pundit to your Gemfile and include it in your ApplicationController to enable authorization checks across your Rails app. Pundit provides simple helpers for enforcing policies and handling unauthorized access.

```ruby
# Gemfile
gem 'pundit'
```

```ruby
# app/controllers/application_controller.rb
class ApplicationController < ActionController::Base
  include Pundit

  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  private

  def user_not_authorized
    flash[:alert] = 'You are not authorized to perform this action.'
    redirect_to(request.referrer || root_path)
  end
end
```
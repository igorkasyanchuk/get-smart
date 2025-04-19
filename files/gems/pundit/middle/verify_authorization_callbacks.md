## ✅ Enforce Authorization with `after_action` Callbacks
Automatically verify Pundit checks in every controller action to prevent missing authorizations. Use `verify_authorized` for non-index actions and `verify_policy_scoped` for index actions, and handle `Pundit::NotAuthorizedError` in a centralized place.

```ruby
class ApplicationController < ActionController::Base
  include Pundit

  after_action :verify_authorized, except: :index, unless: :devise_controller?
  after_action :verify_policy_scoped, only: :index, unless: :devise_controller?

  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  private

  def user_not_authorized
    flash[:alert] = "You are not authorized to perform this action."
    redirect_to(request.referrer || root_path)
  end
end
```

```ruby
class PostsController < ApplicationController
  def show
    @post = Post.find(params[:id])
    authorize @post
  end
end
```

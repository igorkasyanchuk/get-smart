## 🔒 Dynamic Strong Parameters with Custom Filters

For APIs handling varying fields, define permit filters dynamically using lambdas or policy objects. This prevents mass-assignment vulnerabilities while keeping parameter logic declarative and adaptive to user roles or request contexts.

```ruby
class UsersController < ApplicationController
  def create
    user = User.new(permitted_user_params)
    user.save!
    render json: user
  end

  private

  def permitted_user_params
    base = %i[name email]
    base << :admin if current_user.admin?
    params.require(:user).permit(*base, settings: settings_filter)
  end

  def settings_filter
    # Dynamically allow nested keys based on feature flags
    Feature.enabled?(:advanced_settings) ? {} : []
  end
end
```
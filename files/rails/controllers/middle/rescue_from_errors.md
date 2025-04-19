## 🛡️ Graceful Error Handling with rescue_from
Use `rescue_from` in controllers to catch exceptions and render user-friendly error pages or JSON errors. Placing it in `ApplicationController` ensures consistent error handling across all controllers. Customize handling for different exception types.

```ruby
class ApplicationController < ActionController::Base
  rescue_from ActiveRecord::RecordNotFound, with: :render_not_found

  private

  def render_not_found
    respond_to do |format|
      format.html { render 'errors/not_found', status: :not_found }
      format.json { render json: { error: 'Resource not found' }, status: :not_found }
    end
  end
end
```
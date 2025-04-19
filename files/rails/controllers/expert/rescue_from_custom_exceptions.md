## 🚨 Granular Error Handling with rescue_from

Centralize exception handling in `ApplicationController` using `rescue_from` for custom exceptions. Return structured JSON or HTML errors, and integrate internationalization or logging hooks as needed.

```ruby
class ApplicationController < ActionController::API
  rescue_from AuthenticationError, with: :handle_auth_error
  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found

  private

  def handle_auth_error(exception)
    render json: { error: exception.message }, status: :unauthorized
  end

  def record_not_found(exception)
    render json: { error: 'Resource not found' }, status: :not_found
  end
end
```
## 🔄 Use `rescue_from` for Graceful Error Handling
Centralize exception handling at the controller or application level. Map exceptions to HTTP status codes and JSON error messages.

```ruby
class ApplicationController < ActionController::API
  rescue_from ActiveRecord::RecordNotFound, with: :not_found
  rescue_from Pundit::NotAuthorizedError, with: :forbidden

  private

  def not_found(exception)
    render json: { error: exception.message }, status: :not_found
  end

  def forbidden(exception)
    render json: { error: 'Access denied' }, status: :forbidden
  end
end
```
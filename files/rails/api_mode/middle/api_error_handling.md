## 🚨 Centralize Error Handling in API Controllers
Handle exceptions consistently by rescuing from errors in a base API controller. Define a custom error response format and ensure all controllers inherit from this base. This simplifies debugging and provides clear error messages to clients.

```ruby
# app/controllers/api_controller.rb
class ApiController < ActionController::API
  rescue_from ActiveRecord::RecordNotFound, with: :render_not_found
  rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable

  private

  def render_not_found(error)
    render json: { error: error.message }, status: :not_found
  end

  def render_unprocessable(error)
    render json: { errors: error.record.errors.full_messages }, status: :unprocessable_entity
  end
end

# Other controllers inherit from ApiController
class Api::V1::PostsController < ApiController
  # ...
end
```

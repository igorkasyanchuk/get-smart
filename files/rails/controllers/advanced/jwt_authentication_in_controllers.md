## 🔒 Secure Controllers with JWT Authentication
Use JWT for stateless API authentication. Decode tokens in a base controller filter and set current user accordingly.

```ruby
class Api::BaseController < ActionController::API
  before_action :authenticate_request

  private

  def authenticate_request
    token = request.headers['Authorization']&.split(' ')&.last
    payload = JWT.decode(token, Rails.application.secrets.secret_key_base)[0]
    @current_user = User.find(payload['user_id'])
  rescue JWT::DecodeError
    render json: { error: 'Unauthorized' }, status: :unauthorized
  end
end
```
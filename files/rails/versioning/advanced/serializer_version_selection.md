## 🔄 Dynamic Serializer Selection by API Version
Implement dynamic serializer resolution in your controllers to adapt JSON schema as your API evolves. By constructing the serializer class name at runtime, you avoid repetitive branching logic.

```ruby
# app/controllers/api/base_controller.rb
class Api::BaseController < ActionController::API
  private

  def api_version
    request.headers['Accept']&.match(/vnd\.myapp\.v(\d+)/)&.[](1).to_i || 1
  end

  def render_resource(resource)
    serializer = "Api::V#{api_version}::#{resource.class.name}Serializer".constantize
    render json: resource, serializer: serializer
  end
end
```

```ruby
# app/controllers/api/v2/users_controller.rb
class Api::V2::UsersController < Api::BaseController
  def show
    user = User.find(params[:id])
    render_resource(user)
  end
end
```

This pattern centralizes version detection and lets you place separate serializers under `app/serializers/api/v{n}/`, enabling backward-compatible API changes with minimal controller edits.
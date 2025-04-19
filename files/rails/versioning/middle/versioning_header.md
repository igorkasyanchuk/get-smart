## 🛠️ Versioning via Custom Request Headers
Using headers lets you keep routes clean and change versions dynamically without URL changes. Clients specify their desired API version in a header, and you switch controllers accordingly.

```ruby
# app/controllers/api/base_controller.rb
class Api::BaseController < ActionController::API
  before_action :set_version_module

  private

  def set_version_module
    version = request.headers['Accept-Version'] || 'v1'
    self.class.module_eval { include "Api::#{version.camelize}::Respondable" }
  end
end
```

Make sure clients send `Accept-Version: v2` to hit V2 logic. You can fall back to a default if the header is missing.
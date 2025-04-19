## 🌐 Advanced Content Negotiation with Custom Responders

Create a custom responder to DRY up `respond_to` logic across controllers. Handle JSON, XML, or custom MIME types, enforce API versioning, and provide consistent fallback behavior when formats aren’t supported.

```ruby
# app/responders/api_responder.rb
class ApiResponder < ActionController::Responder
  def to_json
    controller.render(json: resource, status: default_status)
  end

  def api_error
    controller.render(json: { error: resource.errors }, status: :unprocessable_entity)
  end
end

# app/controllers/application_controller.rb
class ApplicationController < ActionController::API
  self.responder = ApiResponder
  respond_to :json
end
```
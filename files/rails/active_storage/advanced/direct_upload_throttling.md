## 🕸 Direct Upload with Custom Throttling

You can throttle direct uploads by extending the built-in controller to limit bandwidth or request rates. This helps protect against DOS attacks and manage server load. Override the controller in your routes and inject a rate limiter like Rack::Attack.

```ruby
# config/routes.rb
Rails.application.routes.draw do
  direct_uploads = ActiveStorage::Engine.routes.named_routes[:rails_direct_uploads]
  delete direct_uploads.path.spec.to_s, to: 'throttled_direct_uploads#create'
end

# app/controllers/throttled_direct_uploads_controller.rb
class ThrottledDirectUploadsController < ActiveStorage::DirectUploadsController
  before_action :throttle_uploads!

  private

  def throttle_uploads!
    key = "upload:#{request.ip}"
    if Rails.cache.increment(key, 1, expires_in: 1.minute) > 60
      render json: { error: 'Rate limit exceeded' }, status: :too_many_requests
    end
  end
end
```
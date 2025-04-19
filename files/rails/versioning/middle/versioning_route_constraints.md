## 🚀 Leverage Route Constraints for Version Management
Route constraints allow fine‑grained control over incoming requests based on path or header values. Define a constraint class to detect the version and route accordingly.

```ruby
# lib/api_version_constraint.rb
class ApiVersionConstraint
  def initialize(version)
    @version = version
  end

  def matches?(req)
    req.headers['Accept-Version'] == @version
  end
end

# config/routes.rb
Rails.application.routes.draw do
  namespace :api do
    scope constraints: ApiVersionConstraint.new('v1') do
      resources :users
    end
    scope constraints: ApiVersionConstraint.new('v2') do
      resources :users, only: [:index, :show]
    end
  end
end
```

This approach decouples routing logic and makes version checks reusable across multiple endpoints.
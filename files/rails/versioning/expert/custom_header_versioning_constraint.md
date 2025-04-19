## 🔍 Header-Based Version Negotiation Constraint
For truly flexible API versioning, implement a custom `RouteConstraint` that inspects the `Accept` header (or a custom header) to drive routing decisions. This allows you to route requests to different controller namespaces without polluting your URL space with version prefixes. You can also fallback to a default version if the header is missing.

```ruby
# lib/constraints/api_version.rb
tclass ApiVersion
  def initialize(version, default = false)
    @version = version
    @default = default
  end

  def matches?(req)
    accept = req.headers['Accept']
    if accept && accept.include?("application/vnd.myapp.v#{@version}+json")
      true
    else
      @default
    end
  end
end
```

Then in `config/routes.rb`:

```ruby
Rails.application.routes.draw do
  namespace :api do
    scope module: :v1, constraints: ApiVersion.new(1, true) do
      resources :posts
    end

    scope module: :v2, constraints: ApiVersion.new(2) do
      resources :posts
    end
  end
end
```

## 🛠️ Dynamic API Version Constraints
Leverage a custom routing constraint to serve multiple API versions side by side, using headers or URL parameters. This approach keeps your controllers clean and allows seamless deprecation and rollback of endpoints without cluttering your routes.

```ruby
# lib/api_version_constraint.rb
class ApiVersionConstraint
  def initialize(options)
    @version = options[:version]
    @default = options[:default] || false
  end

  def matches?(req)
    version_in_header(req) || default_version?
  end

  private

  def version_in_header(req)
    accept = req.headers['Accept']
    accept&.include?("application/vnd.myapp.v#{@version}+json")
  end

  def default_version?
    @default
  end
end
```

```ruby
# config/routes.rb
Rails.application.routes.draw do
  namespace :api, defaults: { format: :json } do
    scope module: :v1,
          constraints: ApiVersionConstraint.new(version: 1, default: true) do
      resources :posts
    end

    scope module: :v2,
          constraints: ApiVersionConstraint.new(version: 2) do
      resources :posts
    end
  end
end
```

This lets clients request `Accept: application/vnd.myapp.v2+json` or fall back to v1 when the header is absent.
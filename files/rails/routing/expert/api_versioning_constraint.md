## 🚀 API Versioning with Custom Constraint

When you need multiple API versions coexisting in the same Rails app, a custom constraint class gives you full control over the request matching logic. You can inspect headers, query params, or subdomains to route requests to the correct versioned controller without polluting your controllers with version checks.

```ruby
# lib/api_version_constraint.rb
class ApiVersionConstraint
  def initialize(options)
    @version = options[:version]
    @default = options.fetch(:default, false)
  end

  def matches?(request)
    header = request.headers['Accept']
    has_version = header && header.include?("application/vnd.myapp.v#{@version}+json")
    @default || has_version
  end
end

# config/routes.rb
Rails.application.routes.draw do
  scope module: 'api' do
    scope module: 'v1', constraints: ApiVersionConstraint.new(version: 1, default: true) do
      resources :users
    end

    scope module: 'v2', constraints: ApiVersionConstraint.new(version: 2) do
      resources :users, only: [:index, :show]
    end
  end
end
```
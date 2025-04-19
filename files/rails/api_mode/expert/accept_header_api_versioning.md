## 🧩 API Versioning via Accept Header Constraints
Implement version negotiation by inspecting the `Accept` header rather than URL paths. Create a custom route constraint and fallback logic to maintain backward compatibility without polluting URIs.

```ruby
# lib/api_constraints.rb
class ApiConstraints
  def initialize(options)
    @version = options[:version]
    @default = options[:default]
  end

  def matches?(req)
    accept = req.headers['Accept']
    has_version = accept&.include?("application/vnd.myapp.v#{@version}+json")
    @default || has_version
  end
end
```

```ruby
# config/routes.rb
draw do
  namespace :api, defaults: { format: :json } do
    scope module: :v1, constraints: ApiConstraints.new(version: 1, default: true) do
      resources :posts
    end

    scope module: :v2, constraints: ApiConstraints.new(version: 2) do
      resources :posts
    end
  end
end
```
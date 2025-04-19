## 📦 Header‑Based API Versioning

For non‑breaking evolution, isolate versions via custom route constraints that parse `Accept` headers. Define a constraint class and then scope your routes by version. This keeps controllers clean and allows clients to upgrade seamlessly.

```ruby
# lib/api_constraints.rb
class ApiConstraints
  def initialize(options)
    @version = options[:version]
    @default = options[:default]
  end

  def matches?(req)
    header = req.headers['Accept']
    if header&.include?("application/vnd.myapp.v#{@version}+json")
      true
    else
      @default
    end
  end
end

# config/routes.rb
Rails.application.routes.draw do
  namespace :api, defaults: { format: :json } do
    scope module: :v1, constraints: ApiConstraints.new(version: 1, default: true) do
      resources :articles
    end

    scope module: :v2, constraints: ApiConstraints.new(version: 2) do
      resources :articles
    end
  end
end
```
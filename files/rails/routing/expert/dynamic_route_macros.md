## ✨ DRY Route Macros with Metaprogramming

For large APIs or admin panels with repeated patterns (e.g., versioned namespaces or nested admin resources), define your own route macros to keep `routes.rb` clean and DRY. You can extend the `ActionDispatch::Routing::Mapper` to add custom methods, injecting common scopes, constraints, or defaults.

```ruby
# config/initializers/route_macros.rb
module ActionDispatch::Routing
  class Mapper
    def versioned_api(version, **options)
      namespace :api do
        namespace "v#{version}" do
          constraints ApiVersionConstraint.new(version: version, default: options[:default]) do
            yield
          end
        end
      end
    end
  end
end

# config/routes.rb
Rails.application.routes.draw do
  versioned_api(1, default: true) do
    resources :posts
  end

  versioned_api(2) do
    resources :posts, only: [:index, :show]
  end
end
```
## 🚧 Apply Custom Route Constraints for Dynamic Filtering
Use constraint classes or lambdas to route requests based on subdomains, headers, or request attributes. This allows dynamic routing decisions without controller checks.

```ruby
# lib/subdomain_constraint.rb
class SubdomainConstraint
  def initialize(subdomain)
    @subdomain = subdomain
  end

  def matches?(request)
    request.subdomain == @subdomain
  end
end

# config/routes.rb
Rails.application.routes.draw do
  constraints SubdomainConstraint.new('api') do
    namespace :api do
      resources :orders
    end
  end

  # Lambda example
  get '/mobile', to: 'home#mobile', constraints: ->(req) { req.user_agent =~ /Mobile/ }
end
```
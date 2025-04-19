## 📦 Implement API Versioning with Namespaces and Defaults
Manage multiple API versions by namespacing and setting default formats. This isolates versions and allows smooth upgrades without breaking existing clients.

```ruby
# config/routes.rb
Rails.application.routes.draw do
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :users, only: [:index, :show]
    end

    namespace :v2 do
      resources :users, only: [:index, :show, :update]
    end
  end
end
```

Clients specify `/api/v1/users` or `/api/v2/users`. Defaults ensure JSON responses, and you can deprecate old versions gracefully.
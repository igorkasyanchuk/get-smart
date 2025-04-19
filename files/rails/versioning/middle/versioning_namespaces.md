## 🔖 Use Namespaced Controllers for Versioning
Organizing your API by nesting controllers under versioned modules keeps code clear and maintainable. Each version lives in its own namespace, allowing you to evolve endpoints without breaking existing clients.

```ruby
# config/routes.rb
Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :articles, only: [:index, :show]
    end

    namespace :v2 do
      resources :articles, only: [:index, :show, :create]
    end
  end
end
```

In `app/controllers/api/v1/articles_controller.rb`, define version‑specific logic. When you add new features in V2, clients on V1 remain unaffected.
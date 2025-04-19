## 🧩 Leverage Routing Concerns for Reusable Patterns
When multiple resources share custom member or collection actions, routing concerns DRY up your `routes.rb`. Define the shared pattern once and include it in multiple resource blocks.

```ruby
# config/routes.rb
Rails.application.routes.draw do
  concern :commentable do
    resources :comments, only: [:index, :create, :destroy]
  end

  resources :posts, concerns: :commentable
  resources :events, concerns: :commentable
end
```

Routing concerns help you maintain consistency and reduce duplication across resources that share behavior.
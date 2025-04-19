## 📦 Use Routing Concerns for DRY Routes
Routing concerns let you extract reusable sets of routes to keep your `routes.rb` clean and DRY. This is especially helpful when multiple resources share the same nested routes or actions.

```ruby
# config/routes.rb
concern :commentable do
  resources :comments, only: [:index, :create, :destroy]
end

Rails.application.routes.draw do
  resources :posts, concerns: :commentable
  resources :photos, concerns: :commentable
end
```

Here, both `posts` and `photos` get identical `comments` routes without duplication. You can also pass options to concerns or even nest concerns within other resources.
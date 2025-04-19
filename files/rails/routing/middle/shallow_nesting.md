## 🏗️ Apply Shallow Nesting to Prevent Deep Routes
Deeply nested resources lead to long URL helpers and complex parameters. Shallow nesting moves `:show`, `:edit`, `:update`, and `:destroy` out of the parent scope automatically.

```ruby
# config/routes.rb
Rails.application.routes.draw do
  resources :authors do
    resources :books, shallow: true
  end
end

# Generated routes:
# GET    /authors/:author_id/books          books#index
# POST   /authors/:author_id/books          books#create
# GET    /books/:id                         books#show
# GET    /books/:id/edit                    books#edit
# PATCH  /books/:id                         books#update
# DELETE /books/:id                         books#destroy
```
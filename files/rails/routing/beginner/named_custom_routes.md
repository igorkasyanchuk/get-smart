## 🔖 Define named custom routes for static pages

For standalone pages (About, Contact, Terms), use custom `get` routes and assign them `as:` names. This gives you easy-to-remember URL helpers.

```ruby
# config/routes.rb
Rails.application.routes.draw do
  get '/about',   to: 'pages#about',   as: 'about'
  get '/contact', to: 'pages#contact', as: 'contact'
end
```

You can now link to these pages with `about_path` and `contact_path` in your views and controllers.
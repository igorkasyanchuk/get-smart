## 🔑 Configure Authentication Routes
Devise provides a convenient routing helper, `devise_for`, which sets up all the necessary routes for sign up, login, logout, password recovery, and more. Place it in your `config/routes.rb` file and define a root path for your application.

```ruby
# config/routes.rb
Rails.application.routes.draw do
  devise_for :users
  root 'home#index'
end
```

Visit `/users/sign_in` or `/users/sign_up` in your browser to confirm routes are working as expected.
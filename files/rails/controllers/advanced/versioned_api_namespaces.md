## ⚡ Handle Versioned APIs with Namespaced Controllers
Maintain backward compatibility by namespacing controllers under version modules. This pattern allows evolving your API without breaking existing clients.

```ruby
# config/routes.rb
namespace :api do
  namespace :v1 do
    resources :users, only: [:index, :show]
  end

  namespace :v2 do
    resources :users, only: [:index, :show, :update]
  end
end
```

Controllers:
```ruby
# app/controllers/api/v1/users_controller.rb
module Api::V1
  class UsersController < ApplicationController
    def index
      render json: User.all
    end
  end
end
```
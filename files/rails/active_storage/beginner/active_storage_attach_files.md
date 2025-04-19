## 📎 Attaching Files to Models

Add `has_one_attached` or `has_many_attached` in your model to declare attachments. Then, in controllers, use the model’s `.attach` method to save uploaded files.

```ruby
# app/models/user.rb
class User < ApplicationRecord
  has_one_attached :avatar
  has_many_attached :documents
end

# app/controllers/users_controller.rb
class UsersController < ApplicationController
  def update
    @user = User.find(params[:id])
    @user.avatar.attach(params[:user][:avatar])
    @user.documents.attach(params[:user][:documents])
    redirect_to @user
  end
end
```
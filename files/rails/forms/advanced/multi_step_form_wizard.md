## 🛣️ Multi-step Form Wizard with Wicked

Implement multi-page forms using the Wicked gem to manage steps, validations, and state transitions. Wicked provides a DSL for defining steps and progress indicators in your controller.

```ruby
# app/controllers/registrations_controller.rb
class RegistrationsController < ApplicationController
  include Wicked::Wizard
  steps :personal, :address, :confirm

  def show
    @user = User.find_or_initialize_by(id: session[:user_id])
    render_wizard
  end

  def update
    @user = User.find_or_initialize_by(id: session[:user_id])
    @user.update(user_params)
    session[:user_id] = @user.id
    render_wizard @user
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :street, :city)
  end
end
```

```erb
<!-- app/views/registrations/personal.html.erb -->
<%= form_with model: @user, url: wizard_path do |f| %>
  <%= f.text_field :name %>
  <%= f.email_field :email %>
  <%= f.submit 'Next' %>
<% end %>
```
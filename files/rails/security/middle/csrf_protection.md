## 🛡️ Enable CSRF Protection

Rails includes CSRF protection by default in `ApplicationController`. Ensure `protect_from_forgery` is not disabled and use authenticity tokens in forms.

```ruby
# app/controllers/application_controller.rb
class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
end
```

```erb
<%= form_with model: @user do |form| %>
  <!-- authenticity_token is included automatically -->
<% end %>
```

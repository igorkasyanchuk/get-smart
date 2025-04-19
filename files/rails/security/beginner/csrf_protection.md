## 🔑 Enable CSRF Protection
Rails includes CSRF protection by default. Ensure your forms include the authenticity token, and verify it in controllers to block forged requests.

```erb
<%= form_with(model: @post) do |f| %>
  <%= f.text_field :title %>
  <%= f.submit %>
<% end %>
```

```ruby
class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
end
```

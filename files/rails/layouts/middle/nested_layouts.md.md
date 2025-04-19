## 🔀 Applying Nested Layouts

Wrap one layout inside another by using `render layout:` within your custom layout. This is useful for namespaced areas like an admin panel that still share the main application wrapper.

```erb
<!-- app/views/layouts/admin.html.erb -->
<%= render layout: 'application' do %>
  <header class="admin-header">
    <h1>Admin Dashboard</h1>
  </header>
  <nav><%= render 'layouts/admin_nav' %></nav>
  <main><%= yield %></main>
<% end %>
```

```ruby
# app/controllers/admin/base_controller.rb
class Admin::BaseController < ApplicationController
  layout 'admin'
end
```
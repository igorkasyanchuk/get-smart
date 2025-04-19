## 🎭 Layout Variants by Format
Use view variants to automatically switch layouts based on format (e.g., `:amp`, `:turbo_stream`). Define variant-specific layouts by naming conventions and set `request.variant` in a middleware or controller.

```ruby
# app/controllers/application_controller.rb
before_action do
  request.variant = :amp if params[:amp] == '1'
end
```

```erb
<!-- app/views/layouts/application.html+amp.html.erb -->
<!DOCTYPE html><html><body>
  <!-- AMP-optimized header -->
  <%= yield %>
</body></html>
```

Rails will pick `application.html+amp` for AMP requests, falling back to `application.html.erb` otherwise. This keeps your code DRY and format-aware.
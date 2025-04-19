## 🔥 Dynamic Routing from Database Models

When pages or features are driven by database records (like CMS pages, feature flags, or tenant-specific routes), you can generate routes at runtime and reload them on each request in development. This ensures your app adapts to changes without a full deploy.

```ruby
# config/routes.rb
Rails.application.routes.draw do
  load_dynamic_routes
end

# lib/dynamic_routes.rb
module DynamicRoutes
  def load_dynamic_routes
    ActiveSupport::Reloader.to_prepare do
      Rails.application.routes_reloader.reload!
      Rails.application.routes.clear!
      Rails.application.routes.draw do
        Page.published.find_each do |page|
          get page.slug, to: 'pages#show', defaults: { id: page.id }
        end
        # re-add your static or API routes here...
      end
    end
  end
end

# config/initializers/dynamic_routes_loader.rb
Rails.application.routes.extend(DynamicRoutes)
```
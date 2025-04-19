## 🔍 Custom Lookup Context for Layout Fallbacks
Override layout lookup to provide fallbacks or multi-tenant support. Extend `lookup_context.find_all` to search additional paths before defaulting to `application` layout.

```ruby
# lib/multi_tenant_layouts.rb
module MultiTenantLayouts
  def find_all(name, prefixes = [], *rest)
    tenant = request.subdomains.first
    super(["layouts/#{tenant}/#{name}", name], prefixes, *rest)
  end
end

# config/initializers/layout_lookup.rb
ActionController::Base.prepend_view_path Rails.root.join('app', 'views')
ActionController::Base.lookup_context.singleton_class.prepend(MultiTenantLayouts)
```

Now Rails attempts `app/views/layouts/tenant_name/application.html.erb` first, then falls back to the default, enabling tenant-specific theming seamlessly.
## 🛣️ Implement Route Globbing for Catch-All Segments
Globbing captures arbitrary parts of the path into a single parameter. This is useful for nested pages, file paths, or CMS-like URL structures.

```ruby
# config/routes.rb
Rails.application.routes.draw do
  get 'pages/*slug', to: 'pages#show', as: :page
end

# Example:
# GET /pages/company/about/team -> params[:slug] == "company/about/team"
```
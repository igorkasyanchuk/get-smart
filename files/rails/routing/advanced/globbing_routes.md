## 🛰️ Use Globbing for Catch‑All or Nested Paths
Route globbing captures arbitrary path segments using a splat (`*`). Commonly used for CMS pages or deeply nested paths without predefined routes.

```ruby
# config/routes.rb
Rails.application.routes.draw do
  # Catch-all for CMS pages
  get 'pages/*slug', to: 'pages#show', as: :page
end

# In controller
class PagesController < ApplicationController
  def show
    @slug = params[:slug]           # => "about/company/history"
    render template: "pages/#{@slug}"
  end
end
```

Globbing routes are powerful but should be placed at the bottom to avoid unintended matches.
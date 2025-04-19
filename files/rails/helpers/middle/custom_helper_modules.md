## ✨ Organizing Code with Custom Helper Modules

Keep your views DRY by grouping related methods in modules. Place them under `app/helpers` and include or expose them via `helper_method` in controllers as needed.

```ruby
# app/helpers/navigation_helper.rb
module NavigationHelper
  def nav_link(text, path)
    active = current_page?(path) ? 'active' : ''
    link_to text, path, class: "nav-item #{active}"
  end
end
```

To make controller methods available in views:

```ruby
class ApplicationController < ActionController::Base
  helper_method :current_account

  def current_account
    @current_account ||= Account.find(session[:account_id])
  end
end
```

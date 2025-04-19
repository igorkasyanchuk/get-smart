## 🎯 Set default_url_options in Controllers
`default_url_options` lets you define URL parameters globally for routing helpers, such as locale or subdomain. Overriding this method in `ApplicationController` ensures that every URL generated includes these defaults automatically.

```ruby
class ApplicationController < ActionController::Base
  def default_url_options
    { locale: I18n.locale }
  end
end

# Now `edit_user_path(@user)` generates `/en/users/1/edit` when locale is en.
```
## 🛣️ Tip: Dynamically Prepend View Paths for Theming
Swap or augment lookup paths at runtime by prepending paths to `ActionController::Base.view_paths`. This supports multi-tenant theming or A/B template testing.

Example:

```ruby
class ThemesController < ApplicationController
  before_action :set_theme_path

  private

  def set_theme_path
    theme = current_user.theme # e.g., 'dark_mode'
    prepend_view_path Rails.root.join('app', 'views', 'themes', theme)
  end
end
```
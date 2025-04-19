## 🔧 Dynamic Layout Selection by Controller Action

Choose layouts at runtime by passing a symbol to `layout` and defining the decision logic in a method. This lets you serve different layouts for mobile, admin, or feature-flagged pages.

```ruby
# app/controllers/application_controller.rb
class ApplicationController < ActionController::Base
  layout :select_layout

  private

  def select_layout
    if params[:mobile] == '1'
      'mobile'
    elsif current_user&.admin?
      'admin'
    else
      'application'
    end
  end
end
```
## 🔄 Dynamic Layout Selection via Controller Lambda
Implement a `layout` method that determines the layout at runtime based on user role, request type, or format. This gives you granular control without duplicating controllers.

In `app/controllers/application_controller.rb`:

```ruby
class ApplicationController < ActionController::Base
  layout :select_layout

  private

  def select_layout
    return "print" if params[:format] == 'pdf'
    return false   if request.xhr?
    return "admin" if current_user&.admin?
    "application"
  end
end
```

Now every request will pick the correct layout: no layout for XHR, a print-specific layout for PDF, the admin shell for admins, and the default otherwise.
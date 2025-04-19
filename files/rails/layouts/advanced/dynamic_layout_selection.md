## 🧩 Dynamic Layout Selection
You can choose layouts at runtime by passing a symbol or lambda to `layout`. This enables context-aware layouts (e.g., mobile vs. desktop) without cluttering the controller. Use a lambda that receives the controller instance to decide the layout dynamically.

```ruby
class ApplicationController < ActionController::Base
  layout ->(controller) {
    if controller.request.format.json?    
      false   # No layout for JSON
    elsif controller.request.user_agent =~ /Mobile/
      "mobile"
    else
      "application"
    end
  }
end
```

This approach centralizes layout logic and adapts to different request properties seamlessly.
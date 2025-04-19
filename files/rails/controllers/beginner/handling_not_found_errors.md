## ⚠️ Handling Not Found Errors

When a record isn't found, Rails raises `ActiveRecord::RecordNotFound`, resulting in a 404. Rescue these exceptions in your controller or `ApplicationController` for a friendly error page.

```ruby
class ApplicationController < ActionController::Base
  rescue_from ActiveRecord::RecordNotFound, with: :not_found

  private

  def not_found
    render file: Rails.public_path.join('404.html'), status: :not_found
  end
end
```
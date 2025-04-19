## ⏰ Configure Rolling Session Expiration

To improve security, implement a rolling session expiration by updating the expiry time on each request. Use a controller callback to reset `session[:expires_at]`, and wipe the session when it has expired. This ensures active users stay logged in, while idle sessions automatically expire.

```ruby
class ApplicationController < ActionController::Base
  before_action :refresh_session_expiry

  private

  def refresh_session_expiry
    session[:expires_at] ||= 30.minutes.from_now
    if Time.current > session[:expires_at]
      reset_session
      redirect_to new_session_path, alert: "Your session has expired."
    else
      # Extend expiration on activity
      session[:expires_at] = 30.minutes.from_now
    end
  end
end
```
## ⏳ Implement Sliding Session Expiration
By default, Rails cookie sessions expire after a fixed interval from creation, not from last access. To extend a user’s session on each request, insert a custom middleware that refreshes the cookie’s `expires` attribute on every response. This ensures active users aren’t logged out unexpectedly while still enforcing absolute timeouts.

```ruby
# lib/sliding_session_middleware.rb
class SlidingSessionMiddleware
  def initialize(app, expire_after:)
    @app = app
    @expire_after = expire_after
  end

  def call(env)
    status, headers, response = @app.call(env)
    # Only patch the session-cookie
    if headers["Set-Cookie"]&.include?("_#{Rails.application.class.module_parent_name.underscore}_session")
      new_expiry = @expire_after.from_now.utc.httpdate
      headers["Set-Cookie"] = headers.get_all("Set-Cookie").map do |cookie|
        if cookie.start_with?("_#{Rails.application.class.module_parent_name.underscore}_session")
          cookie.sub(/expires=[^;]+;/, "expires=#{new_expiry};")
        else
          cookie
        end
      end
    end
    [status, headers, response]
  end
end

# config/application.rb
module MyApp
  class Application < Rails::Application
    config.load_defaults 7.0
    config.middleware.insert_before(
      ActionDispatch::Session::CookieStore,
      SlidingSessionMiddleware,
      expire_after: 30.minutes
    )
  end
end
```
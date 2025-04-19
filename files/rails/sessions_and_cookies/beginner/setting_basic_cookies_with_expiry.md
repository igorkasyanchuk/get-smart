## 🍪 Setting Basic Cookies with Expiry

Cookies allow you to store data client‑side and can persist after the browser is closed. In Rails, use the `cookies` helper in your controllers or views. You can specify options like `expires` to control how long the cookie lives.

```ruby
class WelcomeController < ApplicationController
  def index
    # Set a cookie that expires in 7 days
    cookies[:visited_at] = { value: Time.current.to_s, expires: 7.days.from_now }
    render plain: "Welcome back! You last visited at #{cookies[:visited_at]}"
  end
end
```
## 🔒 Using Signed Cookies for Tamper Protection

Signed cookies ensure the stored value hasn’t been tampered with on the client side. Rails automatically signs cookies if you use `signed`, preventing users from forging or altering them. This is ideal for tracking total visits without exposing sensitive data.

```ruby
class VisitsController < ApplicationController
  def show
    visits = cookies.signed[:visits].to_i
    visits += 1
    cookies.signed[:visits] = { value: visits, expires: 30.days.from_now }
    render plain: "You have visited #{visits} times!"
  end
end
```
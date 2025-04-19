## 🔒 Custom Warden Strategy for Two-Factor Authentication
Enhance Devise by injecting a custom Warden strategy that enforces two-factor authentication (2FA) after the standard credential check. This approach intercepts the authentication flow at the Warden layer, allowing you to prompt for and verify a one‑time password (OTP) without patching Devise internals. You can leverage `ROTP` or `devise‑two_factor` for generating and validating the OTP.

```ruby
# config/initializers/warden_2fa.rb
Warden::Strategies.add(:two_factor) do
  def valid?
    user = User.find_by(email: params[:user][:email])
    user&.valid_password?(params[:user][:password]) && params[:user][:otp_attempt]
  end

  def authenticate!
    user = User.find_by(email: params[:user][:email])
    if user&.validate_and_consume_otp!(params[:user][:otp_attempt])
      success!(user)
    else
      fail!('Invalid two‑factor code')
    end
  end
end

Devise.setup do |config|
  config.warden do |manager|
    manager.default_strategies(scope: :user).unshift :two_factor
  end
end
```
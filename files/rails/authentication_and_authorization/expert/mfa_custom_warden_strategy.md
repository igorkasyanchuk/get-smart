## 🔒 Implement Multi-Factor Authentication with a Custom Warden Strategy

Adding a second authentication factor at the Warden layer lets you enforce 2FA at the lowest possible point and fail early. You can define a custom strategy that checks a one-time password (OTP) after Devise’s primary authentication, then inject it into `Devise.warden`. This ensures your entire app benefits from the same flow without polluting controllers.

```ruby
# config/initializers/warden.rb
Rails.application.config.middleware.use Warden::Manager do |manager|
  manager.default_strategies scope: :user, strategies: [:database_authenticatable, :otp_authenticatable]
  manager.failure_app = Devise::FailureApp
end

Warden::Strategies.add(:otp_authenticatable) do
  def valid?
    params['user'] && params['user']['otp_code']
  end

  def authenticate!
    user = User.find_by(email: params['user']['email'])
    return fail! unless user&.valid_password?(params['user']['password'])

    if user.validate_and_consume_otp!(params['user']['otp_code'])
      success!(user)
    else
      fail!('Invalid OTP code')
    end
  end
end
```

Then in your Devise sessions controller, prompt for OTP on the second step, verifying via the above strategy. This approach cleanly composes with Devise’s pipeline and ensures uniform failure handling.
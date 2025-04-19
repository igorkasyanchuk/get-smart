## 👤 Two-Factor Auth with Devise and ROTOTP

Add 2FA by integrating `devise-two-factor` or `rotp`. Store encrypted TOTP secrets and verify codes on sign-in.

```ruby
gem 'devise-two-factor'
```

```ruby
# app/models/user.rb
devise :two_factor_authenticatable,
       otp_secret_encryption_key: Rails.application.credentials.otp_key
```
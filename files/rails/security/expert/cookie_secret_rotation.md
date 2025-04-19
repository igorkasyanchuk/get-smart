## 🔄 Encrypted & Signed Cookie Rotation
Rotating your `secret_key_base` without invalidating all user sessions is critical during key rollover. Use Rails' cookie rotations to gracefully accept old cookies while issuing new ones under the fresh key.

```ruby
# config/initializers/cookie_rotation.rb
Rails.application.config.action_dispatch.cookies_serializer = :json
Rails.application.config.action_dispatch.cookies_rotations.tap do |cookies|
  # Rotate encrypted cookies
  cookies.rotate :encrypted, Rails.application.credentials.old_secret_key_base
  cookies.rotate :signed,    Rails.application.credentials.old_secret_key_base
end
```

All existing cookies encrypted with `old_secret_key_base` will still be decrypted, while new cookies will use the current `secret_key_base` from `Rails.application.credentials`.

## 🔄 Dynamically Rotating Session Secrets Without User Disruption

To rotate session secrets safely across deploys (e.g., when you detect compromise or on a schedule) without forcing all users to re‑login, use multiple `secret_stores` in your Rails credentials. Rails will try each key until one matches.

1. In `config/initializers/session_store.rb`, configure an array of secrets:

```ruby
Rails.application.config.session_store :cookie_store,
  key: "_myapp_session",
  secure: Rails.env.production?,
  expire_after: 2.weeks,
  secret_stores: [
    Rails.application.credentials.dig(:sessions, :old_secret),
    Rails.application.credentials.dig(:sessions, :current_secret)
  ]
```

2. Deploy with both `old_secret` and `current_secret` set. After verification, reissue code without `old_secret` for full rotation.

3. To proactively rotate, generate a fresh secret and add it to the front of `secret_stores` so new sessions use it first, while existing sessions still decrypt with any of the older ones.
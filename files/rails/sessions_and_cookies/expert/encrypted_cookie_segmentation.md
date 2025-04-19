## 🔑 Advanced Encrypted Cookie Segmentation

When you need to store small, non‑sensitive data alongside your main session without inflating the session payload, you can leverage Rails’ `encrypted_cookie` jar in parallel to your server‑side session store. This keeps the main session lean (in Redis or DB) while enabling tamper‑proof client‑side storage for flags or feature toggles.

1. Configure an additional encrypted cookie in `application_controller.rb`:

```ruby
class ApplicationController < ActionController::Base
  before_action :load_feature_flags

  private

  def feature_flags
    cookies.encrypted[:feature_flags] ||= {}
  end

  def load_feature_flags
    @feature_flags = feature_flags
  end
end
```

2. Write to the encrypted cookie without hitting your DB:

```ruby
# In any controller or service
current_flags = cookies.encrypted[:feature_flags] || {}
current_flags[:beta_ui] = true
cookies.encrypted[:feature_flags] = {
  value: current_flags,
  expires: 1.week.from_now,
  secure: Rails.env.production?,
  same_site: :lax
}
```

3. This pattern isolates ephemeral toggles in the client, avoids session bloat in Redis/DB, and ensures confidentiality and integrity via encryption.
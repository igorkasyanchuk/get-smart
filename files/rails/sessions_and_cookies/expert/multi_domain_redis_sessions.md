## 🌐 Multi-Domain Session Sharing with Custom Redis Store

When you operate across subdomains (e.g., `app.example.com` and `admin.example.com`), share sessions in Redis while isolating session data per domain or path. Define a custom session store that scopes keys by domain.

1. Create a custom Redis store under `lib/multi_domain_session_store.rb`:

```ruby
require "action_dispatch/middleware/session/redis_store"

class MultiDomainSessionStore < ActionDispatch::Session::RedisStore
  private

  # Prefix session ID with domain to avoid collisions
  def prefixed_session_key(session_id, _env)
    domain = @env["HTTP_HOST"].split(':').first.gsub('.', '_')
    "sess:#{domain}:#{session_id}"
  end
end
```

2. Configure it in `config/initializers/session_store.rb`:

```ruby
require Rails.root.join("lib/multi_domain_session_store")

Rails.application.config.session_store :multi_domain_session_store,
  servers: { host: "localhost", port: 6379, db: 0 },
  key: "_myapp_session",
  expire_after: 30.minutes,
  secure: Rails.env.production?,
  same_site: :lax
```

3. Now sessions are isolated per subdomain in Redis, preventing key collisions and enabling shared Redis infrastructure.
## 💼 Layer Environment Configuration with a Shared Common File

When managing multiple similar environments (e.g. staging, QA, preview), extract shared settings into a `common.rb` and deep‑merge per‑env overrides. This ensures DRYness and allows you to evolve the common base without copy‑pasting.

Create `config/environments/common.rb`:

```ruby
Rails.application.configure do
  # shared logging
  config.log_level       = :info
  config.log_tags        = [:request_id]

  # shared cache store
  config.cache_store     = :redis_cache_store,
                         { url: ENV.fetch("REDIS_URL") }
end
```

In `config/environments/staging.rb`:

```ruby
require_relative "common"

Rails.application.configure do
  # deep merge common settings
  config = Rails.application.config
  config.environment_variables = config_for(:environment).deep_symbolize_keys

  # staging‑only overrides
  config.log_level = :debug
  config.action_mailer.perform_deliveries = true
end
```

## 🛡️ Multi-layer Encrypted Credentials

By default Rails loads a single encrypted credentials file per environment. As an expert, you can layer multiple `ActiveSupport::EncryptedConfiguration` instances to share secrets across services or add ephemeral overrides. This approach lets you keep `shared.yml.enc` for common keys (e.g. API URIs) and `<env>.yml.enc` for environment‑specific tokens.

In `config/initializers/credentials_layers.rb`:

```ruby
# Load shared credentials (common across all environments)
shared_cfg = ActiveSupport::EncryptedConfiguration.new(
  config_path: Rails.root.join("config/credentials/shared.yml.enc"),
  key_path:    Rails.root.join("config/credentials/shared.key"),
  env_key:     "RAILS_SHARED_KEY"
)

# Load app‑specific credentials for current environment
env_cfg = ActiveSupport::EncryptedConfiguration.new(
  config_path: Rails.root.join("config/credentials/#{Rails.env}.yml.enc"),
  key_path:    Rails.root.join("config/credentials/#{Rails.env}.key"),
  env_key:     "RAILS_MASTER_KEY"
)

# Deep merge shared + env into Rails.application.credentials
merged = shared_cfg.config.deep_symbolize_keys.merge(env_cfg.config.deep_symbolize_keys)
Rails.application.credentials.config = merged
```

Now access combined secrets anywhere via:

```ruby
Rails.application.credentials[:third_party_api_key]
Rails.application.credentials[:shared_service_url]
```
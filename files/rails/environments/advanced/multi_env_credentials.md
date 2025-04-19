## 🛡️ Managing Multiple Environment Credentials

Rails 5.2+ credentials support multiple environments out of the box. This lets you store secrets (API keys, certificates) per environment in encrypted YAML files. Use the `--environment` flag to create or edit a credentials file for `staging`, `production`, etc., and access them dynamically.

```bash
# Create or edit staging credentials
a EDITOR="vim" rails credentials:edit --environment staging
```

This generates or updates `config/credentials/staging.yml.enc` alongside a unique `config/credentials/staging.key`. Access secrets in your code via:

```ruby
# anywhere in your app
aws_key = Rails.application.credentials.staging[:aws][:access_key_id]
aws_secret = Rails.application.credentials.staging[:aws][:secret_access_key]
```

If a credential is missing in staging, Rails will fallback to `config/credentials/production.yml.enc` (when RAILS_ENV=production). This pattern ensures strict separation of secrets per environment while reusing defaults.
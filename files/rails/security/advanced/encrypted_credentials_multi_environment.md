## 🔐 Encrypted Credentials for Multiple Environments

Rails 6+ supports multiple credential files. Store sensitive keys per environment and load as needed.

```bash
EDITOR="vim" rails credentials:edit --environment production
```

```yaml
# config/credentials/production.yml.enc
aws:
  access_key_id: YOUR_KEY
  secret_access_key: YOUR_SECRET
```

```ruby
Aws::S3::Client.new(
  access_key_id: Rails.application.credentials.dig(:aws, :access_key_id),
  secret_access_key: Rails.application.credentials.dig(:aws, :secret_access_key)
)
```
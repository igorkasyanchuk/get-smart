## 🔑 Managing Production Credentials with Rails Encrypted Secrets

Rails 5.2+ offers encrypted credentials per environment, removing the need for manual `ENV` juggling or `.env` files in production. Use the built‑in editor to securely store API keys, database URLs, or third‑party secrets, then fetch them with `Rails.application.credentials`. This keeps secrets out of your repo and simplifies rotation.

```bash
# Open the production credentials in your editor
EDITOR="nano" bin/rails credentials:edit --environment production
```

```yaml
# Inside credentials/production.yml.enc
db:
  url: "postgres://user:pass@db.example.com/my_app_production"
aws:
  access_key_id: "YOUR_KEY"
  secret_access_key: "YOUR_SECRET"
``` 

```ruby
# Using credentials in your app
client = Aws::S3::Client.new(
  access_key_id: Rails.application.credentials.dig(:aws, :access_key_id),
  secret_access_key: Rails.application.credentials.dig(:aws, :secret_access_key),
  region: 'us-east-1'
)
```
## 🌐 Manage Environment‑Specific Credentials

Rails lets you maintain separate credentials per environment, so you can have different keys for development, test, and production. Simply set `RAILS_ENV` when editing.

```bash
# Edit production credentials instead of development
RAILS_ENV=production EDITOR="nano" bin/rails credentials:edit
```

This command updates `config/credentials/production.yml.enc`. In your code, you still use:

```ruby
Rails.application.credentials.dig(:payment_gateway, :api_key)
```

Rails automatically picks the right credentials file based on `Rails.env`.
## 🔒 Manage Environment-Specific Credentials

Rails 6+ allows you to maintain separate encrypted credentials per environment, keeping production secrets isolated from development and test. Use the `rails credentials:edit --environment production` command to open and update the `config/credentials/production.yml.enc` file with your default `$EDITOR`. After saving, Rails will automatically encrypt your changes with the production master key.

```bash
EDITOR="vim" bin/rails credentials:edit --environment production
```

Access these credentials in your application code with:

```ruby
Rails.application.credentials.production[:api_key]
```
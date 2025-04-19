## 🗝️ Manage Multiple Environments with Encrypted Credentials and Key Rotation

Rails 6+ supports per‑environment credentials out of the box. By customizing `credentials.content_path` and `key_path`, you can store `staging`, `qa`, and `production` secrets in separate files and rotate keys independently.

In `config/application.rb`:
```ruby
module MyApp
  class Application < Rails::Application
    env = Rails.env
    config.credentials.content_path = Rails.root.join("config/credentials/#{env}.yml.enc")
    config.credentials.key_path     = Rails.root.join("config/credentials/#{env}.key")
    config.read_encrypted_secrets  = true
  end
end
```

Create and edit env‑specific credentials:
```bash
bin/rails credentials:edit --environment staging
# Opens config/credentials/staging.yml.enc with its own staging.key
```

Now `Rails.application.credentials.db_password` will refer to the right environment’s secret and you can rotate `staging.key` without touching `production.key`.
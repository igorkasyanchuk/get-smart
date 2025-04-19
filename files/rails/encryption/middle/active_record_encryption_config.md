## 🔒 Configuring Active Record Encryption

Rails 7+ ships with built‑in Active Record Encryption that you can enable with just a few environment variables. This ensures columns marked with `encrypts` are transparently encrypted at rest.

```ruby
# config/application.rb
module MyApp
  class Application < Rails::Application
    # Use secure keys stored in ENV or credentials
    config.active_record.encryption.primary_key        = ENV['RAILS_ENCRYPTION_PRIMARY_KEY']
    config.active_record.encryption.deterministic_key  = ENV['RAILS_ENCRYPTION_DETERMINISTIC_KEY']
    config.active_record.encryption.key_derivation_salt = ENV['RAILS_ENCRYPTION_KEY_DERIVATION_SALT']
  end
end
```

After restarting, simply add `encrypts :sensitive_attribute` in your model and Rails will handle encryption, decryption, and attribute querying automatically.
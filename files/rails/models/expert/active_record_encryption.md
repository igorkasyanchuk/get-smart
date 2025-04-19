## ⚡️ Integrate Rails Active Record Encryption
Rails 7+ supports end‑to‑end encryption at the model layer. Declare attributes as encrypted and let Rails handle AES‑GCM encryption, key rotation, and querying. This is essential for PII compliance.

```ruby
# config/application.rb
config.active_record.encryption.primary_key = Rails.application.credentials.dig(:encryption_primary_key)
config.active_record.encryption.support_unencrypted_data = true

# app/models/user.rb
class User < ApplicationRecord
  encrypts :ssn, :credit_card_number
end
```

Now `user.ssn` is encrypted in the DB, transparent on read/write, and you can rotate keys without downtime.
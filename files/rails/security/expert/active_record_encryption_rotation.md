## 🗝️ ActiveRecord Encryption with Key Rotation
Rails 7+ offers first-class attribute encryption. Configure primary & previous keys for transparent decryption of legacy data, then write new records with the rotated key.

```ruby
# config/application.rb
module MyApp
  class Application < Rails::Application
    config.active_record.encryption.primary_key           = Rails.application.credentials.dig(:current_ark)
    config.active_record.encryption.deterministic_key     = Rails.application.credentials.dig(:current_dk)
    config.active_record.encryption.previous_primary_key  = Rails.application.credentials.dig(:old_ark)
    config.active_record.encryption.previous_deterministic_key = Rails.application.credentials.dig(:old_dk)
  end
end

# app/models/user.rb
class User < ApplicationRecord
  encrypts :ssn
end
```

Records encrypted with your old key remain readable, while new writes automatically use the fresh key set.

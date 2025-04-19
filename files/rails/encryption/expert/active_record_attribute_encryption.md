## 🏷️ Customize Per-Attribute Encryption in ActiveRecord

Rails 7+ natively supports per-attribute encryption with deterministic or random schemes. You can tailor encryption on a per-model basis, enabling features like case-insensitive lookups via deterministic encryption or full confidentiality with random nonces.

```ruby
# config/application.rb
module MyApp
  class Application < Rails::Application
    config.active_record.encryption.primary_key = Rails.application.credentials.db_encryption[:primary_key]
    config.active_record.encryption.deterministic_key = Rails.application.credentials.db_encryption[:deterministic_key]
    config.active_record.encryption.support_unencrypted_data = false
  end
end

# app/models/user.rb
class User < ApplicationRecord
  # Deterministic encryption for lookups (e.g., find_by)
  encrypts :email, deterministic: true, downcase: true

  # Random (non-deterministic) encryption for sensitive blobs
  encrypts :session_token, deterministic: false
end

# Migration to rotate existing data
class RotateUserEmailEncryption < ActiveRecord::Migration[7.0]
  disable_ddl_transaction!
  def up
    say_with_time "Re-encrypting user emails with new key" do
      User.find_each(batch_size: 1000) do |user|
        user.update_column(:email, user.email)
      end
    end
  end
end
```
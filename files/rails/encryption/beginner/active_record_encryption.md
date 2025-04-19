## 🛡️ Use Active Record Encryption (Rails 7+)

Rails 7 ships with built‑in model‐level encryption. After setting `config.active_record.encryption.primary_key` (in `credentials` or env vars), simply declare encrypted attributes:

```ruby
# app/models/user.rb
class User < ApplicationRecord
  encrypts :ssn
end
```

Run a migration to store encrypted data (types `:binary`):

```ruby
class AddEncryptedSsnToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :encrypted_ssn, :binary
  end
end
```

Now Rails will automatically encrypt on write and decrypt on read:

```ruby
user = User.create!(ssn: '123-45-6789')
user.encrypted_ssn           # => 0xAFB34D...
user.ssn                     # => "123-45-6789"
```
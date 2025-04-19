## 🕵️ Blind Index for Searchable Encrypted Fields

Use the `blind_index` gem to create deterministic, hashed indexes on encrypted fields for fast lookups without revealing plaintext.

```ruby
gem 'attr_encrypted'
gem 'blind_index'
```

```ruby
class User < ApplicationRecord
  encrypts :email
  blind_index :email
end

# Query by email:
User.find_by_email_bidx("user@example.com")
```
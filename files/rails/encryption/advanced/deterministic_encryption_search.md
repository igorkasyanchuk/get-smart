## 🔎 Deterministic Encryption for Searchable Fields

By default Rails uses random initialization vectors for encryption, making indices unusable. Enabling **deterministic** encryption on specific attributes allows equality queries, though you lose semantic security guarantees.

```ruby
# app/models/user.rb
class User < ApplicationRecord
  # will always produce the same ciphertext for the same plaintext
  encrypts :email, deterministic: true
  encrypts :ssn, deterministic: true, downcase: true
end
```

```ruby
# Now you can query encrypted fields directly:
User.find_by(email: 'alice@example.com')
```

Note: Avoid using deterministic encryption on high-cardinality or highly sensitive data without additional masking or hashing strategies.
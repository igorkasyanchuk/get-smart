## 🗝️ Encrypt Sensitive Attributes

Use Active Record Encryption (Rails 7+) to encrypt attributes transparently at rest.

```ruby
# app/models/payment.rb
class Payment < ApplicationRecord
  encrypts :credit_card_number
end

# Usage
payment = Payment.create(credit_card_number: '4111-1111-1111-1111')
payment.credit_card_number # => '4111-1111-1111-1111'
```

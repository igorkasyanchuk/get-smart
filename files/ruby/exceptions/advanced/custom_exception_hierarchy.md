## 🛠️ Custom Exception Hierarchy

Define a clear hierarchy of domain-specific exceptions by subclassing StandardError. This lets you rescue granular errors without catching unrelated issues and improves maintainability. Organize exceptions by grouping them under a common base class and override messages or add attributes where needed.

```ruby
module Payments
  class Error < StandardError; end
  class TransactionError < Error; end
  class InsufficientFunds < TransactionError; end
  class CurrencyMismatch < TransactionError; end
end

begin
  # some payment logic
  raise Payments::InsufficientFunds, "Account balance too low"
rescue Payments::TransactionError => e
  logger.error("Payment failed: #{e.class} - #{e.message}")
end
```
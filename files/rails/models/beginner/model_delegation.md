## 👉 Delegating Methods to Associated Objects

Use `delegate` to forward method calls to associated objects, simplifying code and reducing boilerplate.

```ruby
class Invoice < ApplicationRecord
  belongs_to :customer
  delegate :name, :email, to: :customer, prefix: true
end

invoice = Invoice.first
invoice.customer_name  # returns customer.name
invoice.customer_email # returns customer.email
```
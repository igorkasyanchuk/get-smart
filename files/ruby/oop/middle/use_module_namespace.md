## 📂 Organize Code with Module Namespaces

Group related classes into modules to prevent name clashes and clarify intent. This makes navigation easier and reflects your domain structure.

```ruby
module Billing
  class Invoice
    def total; end
  end

  class Payment
    def process; end
  end
end

inv = Billing::Invoice.new
pay = Billing::Payment.new
```
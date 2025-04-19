## 🧩 Define Composable Custom Matchers
Creating your own matchers with RSpec::Matchers.define gives you full control over failure messages, chainable methods, and optimized matching logic. Use this approach to encapsulate repeated domain-specific assertions into reusable, composable building blocks.

```ruby
# spec/support/matchers/have_valid_invoice.rb
RSpec::Matchers.define :have_valid_invoice do
  chain(:for_customer) do |customer|
    @customer = customer
  end

  match do |invoice|
    invoice.customer == @customer && invoice.items.all?(&:valid?)
  end

  failure_message do |invoice|
    "expected invoice ##{invoice.id} to be valid for customer #{@customer.id}, " \
    "but got errors: #{invoice.errors.full_messages.join(', ')}"
  end
end

# Usage in spec
expect(invoice).to have_valid_invoice.for_customer(customer)
```
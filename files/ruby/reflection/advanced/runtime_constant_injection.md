## ⚙️ Inject or Override Constants at Runtime
Leverage `Module.const_get`, `Module.const_set`, and `Kernel#remove_const` to dynamically override or inject constants (e.g., feature flags or adapters) without restarting your application. Wrap it in a custom loader to hot-swap behavior in production.

```ruby
module PaymentGateways; end

# Dynamically load or swap gateway implementations
def load_gateway(name, impl)
  if PaymentGateways.const_defined?(name)
    PaymentGateways.send(:remove_const, name)
  end
  PaymentGateways.const_set(name, impl)
end

# Usage
class StripeAdapter; def charge; 'stripe charged'; end; end
load_gateway(:Gateway, StripeAdapter)
puts PaymentGateways::Gateway.new.charge  # => "stripe charged"
```
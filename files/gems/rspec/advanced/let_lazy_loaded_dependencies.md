## 💡 Lazy-Load Expensive Dependencies via Let

`let` and `let!` help you control initialization timing for expensive objects like external API wrappers. Use `let` for on-demand instantiation and `let!` when you need eager setup. This approach reduces test startup time and avoids unnecessary resource usage.

```ruby
# Lazy-loaded service client
let(:payment_gateway) do
  PaymentGateway.new(endpoint: 'https://api.pay', timeout: 5)
end

it 'charges the user only when needed' do
  expect(payment_gateway).to receive(:charge).with(100)
  OrderProcessor.new.charge_user(100)
end

# Eager setup for database seed
let!(:default_roles) { Role.seed_defaults }
```
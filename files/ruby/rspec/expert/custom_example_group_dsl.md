## 🛠️ Custom Example Group DSL

Defining your own example group alias lets you create a domain‑specific testing DSL, encapsulating shared setup, helpers, and metadata in one place. You can use `define_example_group_alias` to declare a new `RSpec.describe` style for, say, service specs or API specs, keeping your test suite expressive and DRY.

```ruby
# spec/spec_helper.rb
RSpec::Core::ExampleGroup.define_example_group_alias(:service_spec, 'Service Spec') do |group|
  group.include ServiceHelpers
  group.before(:all) { initialize_service_container }
  group.metadata[:type] = :service
end
```

```ruby
# spec/services/payment_processor_spec.rb
RSpec.service_spec PaymentProcessor do
  it 'processes a payment successfully' do
    result = subject.process(amount: 100)
    expect(result).to be_success
  end
end
```

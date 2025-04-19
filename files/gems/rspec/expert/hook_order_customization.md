## ⚙️ Control Hook Order with `around` and Metadata
Fine-tune your setup/teardown by leveraging `around` hooks and custom metadata. Wrap your examples to orchestrate complex fixtures or external service lifecycles, ensuring deterministic teardown.

```ruby
RSpec.configure do |config|
  config.around(:each, :custom_gateway) do |example|
    gateway = ExternalGateway.setup(mode: :test)
    example.run
    gateway.teardown
  end
end

RSpec.describe PaymentProcessor, :custom_gateway do
  it 'processes with external gateway stubbed' do
    expect(ExternalGateway).to receive(:process).and_return(true)
    expect(processor.charge(amount)).to be_truthy
  end
end
```
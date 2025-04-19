## ⏳ Wrap Examples with Around Hooks for Transactions

Around hooks let you execute code before and after each example, ideal for wrapping tests in database transactions or external service simulations. By structuring setup and teardown in one place, you ensure clean state and avoid leakage between examples. Use `example.run` to yield control inside your hook.

```ruby
# spec/support/around_hooks/transactional.rb
RSpec.configure do |config|
  config.around(:each, :transactional) do |example|
    ActiveRecord::Base.transaction do
      example.run
      raise ActiveRecord::Rollback
    end
  end
end

# Usage in spec
describe 'Order processing', :transactional do
  it 'creates line items without persisting' do
    Order.create!(...)  # will be rolled back
    expect(Order.count).to eq(0)
  end
end
```
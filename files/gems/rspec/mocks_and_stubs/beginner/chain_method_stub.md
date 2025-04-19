## 🔗 Stub Chained Methods with `receive_message_chain`

When you need to stub a chain of method calls on an object, `receive_message_chain` lets you specify the chain in one go. Use it sparingly, as it can hide design issues, but it’s handy for simple stubs.

```ruby
user = double('User')
allow(user).to receive_message_chain(:profile, :full_name).and_return('Jane Doe')

RSpec.describe GreetingService do
  it 'greets the user by full name' do
    service = GreetingService.new(user)
    expect(service.greet).to eq('Hello, Jane Doe!')
  end
end
```
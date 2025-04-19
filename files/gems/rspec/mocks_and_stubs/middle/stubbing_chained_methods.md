## 🔗 Stub chained methods with `receive_message_chain`

When you need to stub a deep method chain (e.g., `obj.one.two.three`), use `receive_message_chain`. Use it sparingly, as it bypasses the Law of Demeter, but it can be handy for legacy code you can’t refactor immediately.

```ruby
RSpec.describe UserService do
  let(:user) { double('User') }

  before do
    allow(user).to receive_message_chain(:profile, :address, :zip).and_return('12345')
  end

  it 'fetches the zip code' do
    service = UserService.new
    expect(service.zip_for(user)).to eq('12345')
  end
end
```

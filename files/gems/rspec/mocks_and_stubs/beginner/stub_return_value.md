## 🛠️ Stub Method Return Values

Stubbing a method lets you specify what it should return without invoking its real implementation. This is useful for isolating the unit under test and avoiding side effects. Use `allow` with `receive` and `and_return` to define the stubbed response.

```ruby
RSpec.describe UserNotifier do
  describe '#welcome_email' do
    it 'sends an email with the correct subject' do
      mailer = double('Mailer')
      allow(mailer).to receive(:deliver).and_return(true)

      notifier = UserNotifier.new(mailer)
      result = notifier.welcome_email

      expect(result).to be true
    end
  end
end
```
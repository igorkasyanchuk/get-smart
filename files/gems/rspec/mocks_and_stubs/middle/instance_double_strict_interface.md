## 🔒 Use `instance_double` for stricter interface checks

Instead of generic doubles, use `instance_double(Class)` to verify your mock’s interface at runtime. It ensures only existing methods are stubbed, catching typos and outdated expectations and keeping your tests aligned with real objects.

```ruby
RSpec.describe UserNotifier do
  let(:user) { instance_double(User, email: 'test@example.com') }

  it 'sends an email' do
    mailer = instance_double(ActionMailer::MessageDelivery)
    allow(UserMailer).to receive(:welcome_email).with(user.email).and_return(mailer)
    expect(mailer).to receive(:deliver_later)

    UserNotifier.new.send_welcome(user)
  end
end
```

## ✅ Testing Mailers

Use built‑in helpers to verify emails are enqueued, sent, and contain the correct content in your test suite. Here’s an example with RSpec:

```ruby
# spec/mailers/user_mailer_spec.rb
require 'rails_helper'

RSpec.describe UserMailer, type: :mailer do
  describe '#welcome_email' do
    let(:user) { create(:user, email: 'foo@example.com', name: 'Foo') }
    let(:mail) { UserMailer.welcome_email(user) }

    it 'renders the headers' do
      expect(mail.subject).to eq('Welcome to My App')
      expect(mail.to).to eq(['foo@example.com'])
      expect(mail.from).to eq(['no-reply@example.com'])
    end

    it 'renders the body' do
      expect(mail.body.encoded).to match("Hello #{user.name}")
    end
  end
end
```

This ensures your mailer methods generate emails with the intended headers and content.
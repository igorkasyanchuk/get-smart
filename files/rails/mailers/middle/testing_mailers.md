## 🧪 Test Mailer Methods with ActionMailer::TestHelper

Ensure your mailers generate correct headers, bodies, and attachments. Use `ActionMailer::TestHelper` in your RSpec or Minitest suites.

```ruby
# spec/mailers/user_mailer_spec.rb
require 'rails_helper'

RSpec.describe UserMailer, type: :mailer do
  include ActionMailer::TestHelper

  describe '#welcome_email' do
    let(:user) { create(:user, email: 'user@example.com') }
    let(:mail) { UserMailer.welcome_email(user) }

    it 'sends to the correct recipient' do
      expect(mail.to).to eq(['user@example.com'])
    end

    it 'includes the correct subject' do
      expect(mail.subject).to match(/Welcome/)  
    end

    it 'renders the inline logo' do
      expect(mail.body.encoded).to include('cid:logo.png')
    end
  end
end
```
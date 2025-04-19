## 🏷️ Tagged Examples and Filtering

Use metadata tags to categorize or focus tests. You can run subsets of specs by tag using `--tag` or `--exclude-tag` CLI flags.

```ruby
RSpec.describe User, :focus do
  it "validates presence of email", :validation do
    user = User.new(email: nil)
    expect(user).not_to be_valid
  end

  it "sends a welcome email", :mailer do
    expect { subject.send_welcome }.to change(ActionMailer::Base.deliveries, :size).by(1)
  end
end
```

Run focused tests:

```bash
rspec --tag focus
```
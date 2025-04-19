## 🎭 Build Custom RSpec Matchers for Pundit Policies

To DRY up repetitive policy specs, define custom RSpec matchers that wrap Pundit’s predicate methods. This yields concise, expressive tests and centralizes failure messages.

```ruby
# spec/support/pundit_matchers.rb
RSpec::Matchers.define :permit do |action|
  match do |policy|
    policy.public_send("#{action}?")
  end

  failure_message do |policy|
    "expected #{policy.class} to permit :#{action} for #{policy.user.inspect} on #{policy.record.inspect}"
  end
end

RSpec::Matchers.define :forbid do |action|
  match do |policy|
    !policy.public_send("#{action}?")
  end

  failure_message do |policy|
    "expected #{policy.class} to forbid :#{action} for #{policy.user.inspect} on #{policy.record.inspect}"
  end
end

# Load matchers automatically
# spec/rails_helper.rb
Dir[Rails.root.join('spec/support/**/*.rb')].each { |f| require f }
```

```ruby
# spec/policies/post_policy_spec.rb
RSpec.describe PostPolicy do
  subject(:policy) { described_class.new(user, post) }

  let(:post) { create(:post) }

  context 'as an admin' do
    let(:user) { create(:user, :admin) }
    it { is_expected.to permit(:update) }
    it { is_expected.to permit(:destroy) }
  end

  context 'as a regular user' do
    let(:user) { create(:user) }
    it { is_expected.to forbid(:destroy) }
    it { is_expected.to forbid(:publish) }
  end
end
```

## 🏎️ Profile and Optimize RSpec with test-prof

Leverage the **test-prof** gem to identify and eliminate slow specs, speed up factories, and reduce redundant setup. You can wrap expensive setups in `before_all` hooks to execute them only once, and use the Factory Profiler to find out which factories are your bottlenecks.

```ruby
# Gemfile
group :development, :test do
  gem 'test-prof'
end
```
Add to your `spec_helper.rb`:

```ruby
require 'test-prof/recipes/rspec/before_all'
require 'test-prof/recipes/factory_profiler'

RSpec.configure do |config|
  # Print top 10 slowest examples
  config.profile_examples = 10

  # Auto-start Factory Profiler
  FactoryProf.start(filename: 'tmp/factory_prof.html')
end
```

In your spec:

```ruby
RSpec.describe UserMailer, :before_all do
  before_all do
    @user = create(:user)
  end

  it 'sends welcome email' do
    expect { UserMailer.welcome(@user).deliver_now }
      .to change { ActionMailer::Base.deliveries.count }.by(1)
  end

  it 'has correct subject' do
    mail = UserMailer.welcome(@user)
    expect(mail.subject).to eq('Welcome!')
  end
end
```

Run `rspec` normally and inspect `tmp/factory_prof.html` for hot factories.
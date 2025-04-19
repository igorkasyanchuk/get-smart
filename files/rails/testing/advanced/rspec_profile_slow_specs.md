## 📈 Profile Slow Specs
Identify and optimize your slowest examples by enabling RSpec's built‑in profiling. Set a threshold to flag the top N slowest tests on every run, so you know exactly where to focus your performance efforts.

```ruby
# In .rspec or spec/spec_helper.rb:
--profile 10

# Or in RSpec.configure:
RSpec.configure do |config|
  config.profile_examples = 10
end

# Example output highlights the slowest specs:
# Top 10 slowest examples (2.34 seconds, 5.0% of total time):
# 1) User signup creates welcome email  (0.45 seconds)
```

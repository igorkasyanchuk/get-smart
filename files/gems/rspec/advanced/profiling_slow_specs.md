## 📊 Profile Slow Specs to Optimize Suite

RSpec can profile the slowest examples or example groups, helping you identify bottlenecks. Activate the profiler to get a report at the end of your run and focus optimization efforts where they matter most. This is critical for large codebases to maintain fast feedback loops.

```ruby
# spec/spec_helper.rb
RSpec.configure do |config|
  config.profile_examples = 10  # show top 10 slowest
end

# Example output
# Top 10 slowest examples:
#  1) Large import job processes CSV rows 1.23 sec ./spec/jobs/import_job_spec.rb:12
#  2) ...
```
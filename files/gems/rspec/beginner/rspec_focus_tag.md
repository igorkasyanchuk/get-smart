## 🔍 Focusing Tests with :focus

When debugging, you can focus on specific examples by tagging them with `:focus`. Configure RSpec to run only focused tests by default in your `.rspec` file.

```ruby
# In .rspec
default_formatter

# In spec file
describe Widget do
  it 'does something important', :focus do
    expect(widget.work?).to be_truthy
  end
end
```

Run all focused tests with:

```bash
rspec --tag focus
```

## 🔪 Integrate Mutant for True Mutation Testing

Mutation testing ensures your specs catch unintended code changes by applying mutations and verifying failures. Use **mutant-rspec** to complement coverage tools and reveal blind spots.

```ruby
# Gemfile
group :development, :test do
  gem 'mutant-rspec', require: false
end
```
Configure `.mutant.yml`:

```yaml
requires:
  - './spec/spec_helper.rb'
integration:
  rspec: true
jobs:
  - {}
```

Run mutation analysis:

```bash
bundle exec mutant --include lib --require my_app -r 'MyApp::Runner' -j4 Calculator#add
```

Example:

```ruby
# lib/calculator.rb
class Calculator
  def add(a, b)
    a + b
  end
end
```

```ruby
# spec/calculator_spec.rb
RSpec.describe Calculator do
  it { expect(subject.add(2, 3)).to eq(5) }
end
```

Mutant will try to invert `+` to detect missing edge-case specs, guiding you to write more robust tests.
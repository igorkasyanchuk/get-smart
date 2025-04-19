## 🔗 Chaining Methods in Custom Matchers

Chainable methods let you build expressive matchers. You can define intermediate chain steps with the `chain` DSL:

```ruby
RSpec::Matchers.define :have_dimensions do |width, height|
  match do |rectangle|
    rectangle.width == width && rectangle.height == height
  end

  chain :allow_margin do |margin|
    @margin = margin
  end

  description do
    desc = "have dimensions #{width}x#{height}"
    desc += " with margin #{@margin}" if defined?(@margin)
    desc
  end
end
```

Usage:

```ruby
expect(rectangle).to have_dimensions(100, 200).allow_margin(10)
expect(rectangle).not_to have_dimensions(50, 50)
```
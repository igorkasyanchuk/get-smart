## 🎨 Create Internal DSLs with `instance_eval`

Using `instance_eval` you can evaluate a block in the context of an object, hiding implementation details and enabling cleaner DSLs. This is the backbone of many Ruby libraries like Rake and Rails routes.

```ruby
class Builder
  attr_reader :steps

  def initialize
    @steps = []
  end

  def step(name)
    @steps << name
  end

  def build(&block)
    instance_eval(&block)
    @steps
  end
end

builder = Builder.new
steps = builder.build do
  step :install
  step :configure
  step :deploy
end

puts steps.inspect
# => [:install, :configure, :deploy]
```
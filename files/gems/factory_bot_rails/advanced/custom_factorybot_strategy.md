## 🔧 Custom FactoryBot Strategy Registration

You can register your own build strategy to encapsulate complex setup logic beyond `:create`, `:build`, or `:attributes`. Custom strategies are especially useful when you need to cache, filter, or batch persist multiple factories.

```ruby
# config/initializers/factory_bot.rb
FactoryBot.register_strategy(:cache_build, CacheBuildStrategy)

class CacheBuildStrategy
  def initialize(klass)
    @klass = klass
  end

  def association_reflection(_name, _overrides)
    :build
  end

  def result(evaluation)
    object = evaluation.object
    Cache.write("factorybot/#{@klass}/#{object.id}", object)
    object
  end
end

# Usage:
let(:user) { FactoryBot.build(:user) }            # default :build
let(:cached_user) { FactoryBot.run_strategy(:cache_build, :user) }
```
## 🛠 Dynamic Attribute Accessors

Use metaprogramming to define attribute readers and writers on the fly. This is handy for cases where attribute names come from configuration or external sources.

```ruby
class Configurable
  def self.configure_with(*attrs)
    attrs.each do |attr|
      define_method(attr) { @config[attr] }
      define_method("#{attr}=") { |val| @config[attr] = val }
    end
  end

  def initialize
    @config = {}
  end
end

class AppSettings < Configurable
  configure_with :theme, :timeout, :api_key
end

settings = AppSettings.new
settings.theme = 'dark'
puts settings.theme  # => "dark"
```
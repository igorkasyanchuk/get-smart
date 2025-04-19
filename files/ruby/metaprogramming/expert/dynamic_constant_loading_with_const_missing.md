## 📦 Dynamic Constant Loading with const_missing

Override `const_missing` in a module or class to autoload constants on demand, reducing boot time and dependencies. Use this pattern to implement your own lazy-loading mechanisms or plugin architectures.

```ruby
module Plugins
  PLUGIN_DIR = File.expand_path('plugins', __dir__)

  def self.const_missing(name)
    file = File.join(PLUGIN_DIR, "#{name.to_s.downcase}.rb")
    if File.exist?(file)
      require file
      const_get(name)
    else
      super
    end
  end
end

# Accessing Plugins.MyPlugin will autoload 'plugins/myplugin.rb'
```
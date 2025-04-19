## 🔌 Dynamically Managing Constants for Plugin Architectures

Building pluggable systems often requires defining, loading, or unloading modules at runtime. Use `Module#const_set`, `#const_get`, and `#remove_const` to inject or evict constants safely under a namespace, enabling hot swapping or sandboxed plugin isolation.

```ruby
# Dynamically define a plugin under MyApp::Plugins
module MyApp; module Plugins; end; end

MyApp::Plugins.const_set(:Logger, Class.new do
  def self.log(msg)
    puts "[LOG] #{msg}"
  end
end)

# Use it
MyApp::Plugins::Logger.log("Hello from plugin")

# Unload it to free memory or reload
MyApp::Plugins.send(:remove_const, :Logger)
```
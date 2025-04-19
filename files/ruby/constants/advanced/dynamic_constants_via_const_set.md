## 📦 Dynamic Namespacing with `const_set` and `const_get`

Use `Module#const_set` and `Module#const_get` to define or retrieve constants at runtime, enabling powerful DSLs and plugin architectures. This allows you to map external configurations or directory structures into Ruby modules and classes on the fly.

```ruby
module PluginLoader
  PLUGIN_DIR = "plugins"

  def self.load_plugins
    Dir["#{PLUGIN_DIR}/*.rb"].each do |file|
      plugin_name = File.basename(file, ".rb").split("_").map(&:capitalize).join
      require_relative file
      # e.g., PluginLoader::UserAuth -> UserAuth class defined in file
      const_set(plugin_name, const_get("PluginLoader::#{plugin_name}"))
    end
  end
end

PluginLoader.load_plugins
puts PluginLoader::UserAuth.new.authenticate
```
## 🧩 Create a Custom Rails Plugin

Rails plugins are gems that hook into a Rails app via Railties. To start, generate a new plugin and add an initializer in the gem’s `lib` folder. This allows you to run code during the host app’s boot process.

```bash
$ rails plugin new greeting_plugin
```   

```ruby
# greeting_plugin/lib/greeting_plugin.rb
module GreetingPlugin
  class Railtie < ::Rails::Railtie
    initializer "greeting_plugin.configure" do
      puts "GreetingPlugin initialized!"
    end
  end
end
```   

In your host app’s `Gemfile`:

```ruby
gem "greeting_plugin", path: "../greeting_plugin"
```

Run `bundle install` to load your plugin into the Rails application.
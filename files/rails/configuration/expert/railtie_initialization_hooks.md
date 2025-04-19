## 🚀 Hook into Railtie Initialization Phases for Granular Configuration

For ultimate control, inject configuration or patch framework components by tapping into `before_configuration`, `before_eager_load`, and `after_initialize` in your `Rails::Application` or custom `Railtie`. This lets you override ENV defaults, adjust autoload paths, or monkey‑patch gems before they boot.

In `config/application.rb`:

```ruby
module MyApp
  class Application < Rails::Application
    # 1) Modify ENV or load external secrets before any config is read
    config.before_configuration do
      ENV['API_TIMEOUT'] ||= '15'
    end

    # 2) Adjust eager_load or autoload paths before classes are loaded
    config.before_eager_load do
      config.autoload_paths << Rails.root.join('lib', 'patches')
    end

    # 3) Extend or patch behavior after full initialization
    config.after_initialize do
      ActiveSupport::Notifications.subscribe('sql.active_record') do |*args|
        event = ActiveSupport::Notifications::Event.new(*args)
        Rails.logger.debug "SQL (#{event.duration.round(1)}ms): #{event.payload[:sql]}"
      end
    end
  end
end
```

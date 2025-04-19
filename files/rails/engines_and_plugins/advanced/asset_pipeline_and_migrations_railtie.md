## 🎨 Customize Engine Asset Pipeline and Migrations

Hook into Rails initializers to automatically append your engine's migrations and assets to the host application. This ensures your engine behaves like a native part of the host app without manual copying.

```ruby
# lib/my_engine/engine.rb
module MyEngine
  class Engine < ::Rails::Engine
    isolate_namespace MyEngine

    # Precompile engine assets
    initializer 'my_engine.assets.precompile' do |app|
      app.config.assets.precompile += %w(
        my_engine/*.js
        my_engine/*.css
      )
    end

    # Auto-append engine migrations
    initializer 'my_engine.append_migrations' do |app|
      next if app.root.to_s.match?(root.to_s)

      config.paths['db/migrate'].expanded.each do |migrate_path|
        app.config.paths['db/migrate'] << migrate_path
      end
    end
  end
end
```

Now running `rails assets:precompile` and `rails db:migrate` will include your engine's assets and migrations seamlessly.
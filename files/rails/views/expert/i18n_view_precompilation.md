## 📈 Precompile Localized View Templates
Boost performance by compiling per-locale view templates during asset precompile. Use `I18n.available_locales` to generate variants.

```ruby
# config/initializers/i18n_views.rb
Rails.application.config.after_initialize do
  I18n.available_locales.each do |locale|
    Dir[Rails.root.join('app/views/**/*.html.erb')].each do |file|
      compiled = ERB.new(File.read(file)).result(binding)
      path = file.sub(/\.erb$/, ".#{locale}.html.erb")
      File.write(path, compiled)
    end
  end
end
```
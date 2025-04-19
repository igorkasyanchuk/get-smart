## ⚙️ Dynamic Namespaced Settings via `config.x` and Reloaders

For settings you change frequently in development, hook into Rails’ reloader to pick up updated values without restarting the server. By combining `config.x` and `to_prepare` hooks, you get live‑reloading custom config stored in YAML or elsewhere.

1. Create `config/custom_settings.yml`:

```yaml
# config/custom_settings.yml
development:
  feature_flag: true
  welcome_message: "Hello, Dev!"
production:
  feature_flag: false
  welcome_message: "Welcome!"
```  

2. In an initializer, load and reload on each request in development:

```ruby
# config/initializers/custom_settings.rb
Rails.application.config.to_prepare do
  raw = Rails.root.join("config/custom_settings.yml").read
  all = YAML.safe_load(ERB.new(raw).result) || {}
  Rails.application.config.x.custom = all.fetch(Rails.env, {})
end
```  

3. Use it anywhere:

```ruby
if Rails.configuration.x.custom["feature_flag"]
  puts Rails.configuration.x.custom["welcome_message"]
end
```
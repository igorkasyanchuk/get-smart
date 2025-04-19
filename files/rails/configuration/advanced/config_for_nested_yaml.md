## 🛠 Advanced Nested YAML and ERB with `config_for`

Rails’ `config_for` method can load complex, environment‑aware settings from YAML files that leverage ERB and YAML anchors. This approach allows you to define defaults, environment overrides, and even computed values in one place, avoiding repetitive initializers.

1. Create `config/service_settings.yml` with defaults, anchors, and ERB:

```yaml
# config/service_settings.yml
defaults: &defaults
  timeout: 5
  retries: 3

production:
  <<: *defaults
  endpoint: <%= ENV.fetch("SERVICE_URL") %>/api/v1

development:
  <<: *defaults
  endpoint: "http://localhost:3001/api/v1"

test:
  <<: *defaults
  endpoint: "http://test.local/api/v1"
```  

2. In `config/application.rb`, wire it into `config.x`:

```ruby
# config/application.rb
module MyApp
  class Application < Rails::Application
    config.x.service = config_for(:service_settings)
  end
end
```  

3. Access in your code:

```ruby
# app/services/my_service.rb
timeout = Rails.configuration.x.service["timeout"]
endpoint = Rails.configuration.x.service["endpoint"]
```
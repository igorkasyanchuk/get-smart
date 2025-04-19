## 🛠️ Organize Configuration with Module Constants

Defining configuration values as constants within a dedicated module helps centralize settings and makes them easy to locate and update. By grouping related constants, you avoid scattering magic values throughout your codebase and simplify testing and overrides.

```ruby
# config/app_settings.rb
module AppSettings
  API_ENDPOINT = 'https://api.example.com'.freeze
  TIMEOUT       = 5 # seconds
  RETRIES       = 3
end
```

```ruby
# usage in your service class
class ApiClient
  def initialize
    @base_url = AppSettings::API_ENDPOINT
    @timeout  = AppSettings::TIMEOUT
  end
end
```

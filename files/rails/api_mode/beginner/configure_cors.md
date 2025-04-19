## 🌐 Configure Cross-Origin Resource Sharing (CORS)

To allow browser-based clients from different origins to access your API, add the `rack-cors` gem and configure it in your application. This lets you control which domains and HTTP methods are allowed.

```ruby
# Gemfile
gem 'rack-cors'
```  
```ruby
# config/application.rb
module MyApi
  class Application < Rails::Application
    # ...

    # Insert CORS middleware at the top
    config.middleware.insert_before 0, Rack::Cors do
      allow do
        origins '*'  # change '*' to specific domains in production
        resource '*', headers: :any, methods: [:get, :post, :put, :patch, :delete, :options]
      end
    end
  end
end
```
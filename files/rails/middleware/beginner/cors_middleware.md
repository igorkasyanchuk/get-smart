## 🌐 Handling CORS with rack-cors Middleware

To safely allow cross-origin requests (e.g., from your front-end at a different domain), use the `rack-cors` gem. Configure it in Rails to define which origins and HTTP methods are permitted.

```ruby
# Gemfile
gem 'rack-cors'

# config/application.rb
module YourApp
  class Application < Rails::Application
    # Insert CORS middleware at the top
    config.middleware.insert_before 0, Rack::Cors do
      allow do
        origins 'https://example.com'
        resource '/api/*',
                 headers: :any,
                 methods: [:get, :post, :put, :delete, :options]
      end
    end
  end
end

# Now your API routes under /api will accept requests from example.com
```
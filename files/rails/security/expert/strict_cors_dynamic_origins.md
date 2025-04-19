## 🌐 Strict CORS with Dynamic Origins
Open CORS rules can expose your API to unauthorized origins. Use `rack-cors` with a dynamic lambda that validates each request’s `Origin` against your own source-of-truth (DB, ENV, etc.).

```ruby
# config/initializers/cors.rb
Rails.application.config.middleware.insert_before 0, Rack::Cors do
  allow do
    origins ->(source, _env) { AllowedOriginList.include?(source) }
    resource '/api/*',
      headers: :any,
      methods: [:get, :post, :patch, :delete, :options],
      credentials: true
  end
end
```

`AllowedOriginList` can be a Redis-backed set or ENV lookup that you maintain separately from code.

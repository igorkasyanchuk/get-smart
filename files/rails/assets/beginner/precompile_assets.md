## 📦 Precompile Assets for Production

In production, Rails serves precompiled assets to improve performance. Run the built-in rake task before deployment and configure your environment to disable on-the-fly compilation.

```bash
# Generate optimized assets in public/assets
bin/rails assets:precompile RAILS_ENV=production
```

```ruby
# config/environments/production.rb
config.assets.compile = false
```
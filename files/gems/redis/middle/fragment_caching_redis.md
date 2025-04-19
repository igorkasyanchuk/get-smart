## 🗄️ Use Redis for Fragment Caching

By configuring Rails.cache to use Redis, you can store view fragments efficiently and set expirations to automatically evict stale data. This reduces database load and speeds up page rendering for parts of your views that change infrequently.

```ruby
# config/environments/production.rb
Rails.application.configure do
  config.cache_store = :redis_cache_store, { url: ENV['REDIS_URL'], expires_in: 12.hours }
end

# app/views/posts/_sidebar.html.erb
<% cache 'posts_sidebar' do %>
  <!-- expensive DB call -->
<% end %>
```
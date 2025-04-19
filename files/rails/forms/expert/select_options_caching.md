## 🔄 Performance Optimization: Caching Heavy Select Collections
Avoid repeated DB hits for large select inputs by caching collections with low TTL and invalidation hooks. Wrap the collection fetch in `Rails.cache.fetch` and expire on relevant model callbacks.

```ruby
# app/helpers/form_collections.rb
module FormCollections
  def cached_user_options
    Rails.cache.fetch('user_options', expires_in: 1.hour) do
      User.active.order(:name).pluck(:name, :id)
    end
  end
end

# In a model or observer
after_commit :expire_user_options_cache, on: [:create, :update, :destroy]

def expire_user_options_cache
  Rails.cache.delete('user_options')
end
```

```erb
<%= f.select :assignee_id, cached_user_options, prompt: 'Select user' %>
```
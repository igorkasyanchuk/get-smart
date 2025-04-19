## ⚙️ Association Callbacks for Cache Invalidation
Use `after_add` and `before_remove` callbacks on associations to trigger side-effects like cache invalidation or notifications. This keeps related state in sync automatically when associations change.

```ruby
class Playlist < ApplicationRecord
  has_many :songs,
           after_add:    :invalidate_duration_cache,
           before_remove: :invalidate_duration_cache

  def invalidate_duration_cache(_song)
    Rails.cache.delete([self, :total_duration])
  end
end

# Now adding or removing songs auto-clears the cached total_duration
playlist.songs << Song.first
```
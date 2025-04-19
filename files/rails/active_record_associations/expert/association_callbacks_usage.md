## 📝 Association Callbacks for Lifecycle Hooks

Use `after_add` and `before_remove` callbacks to tie side effects directly to association changes. This is especially useful for maintaining denormalized data or triggering background jobs.

```ruby
class Playlist < ApplicationRecord
  has_many :songs,
           after_add:    ->(pl, s) { pl.log_addition(s) },
           before_remove: ->(pl, s) { pl.archive_song(s) }

  def log_addition(song)
    Rails.logger.info "Added #{song.title} to #{name}"
  end

  def archive_song(song)
    song.update!(archived: true)
  end
end
```

## 💾 Persist Timestamps or Flags with `before_save`
The `before_save` callback runs just before a record is written to the database. This is perfect for setting flags or timestamps not handled by Rails by default.

```ruby
class Article < ApplicationRecord
  before_save :set_published_at

  private

  def set_published_at
    self.published_at ||= Time.current if published?
  end
end
```

If an article is marked `published` and `published_at` is blank, this callback sets the timestamp automatically.
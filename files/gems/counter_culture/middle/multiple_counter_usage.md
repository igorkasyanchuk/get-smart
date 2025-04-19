## ➕ Counting Multiple Columns Simultaneously
When you need to maintain more than one counter on the same association (e.g., likes and dislikes), CounterCulture lets you declare multiple counters in a single call. This reduces duplication and keeps your model callbacks concise.

```ruby
# app/models/vote.rb
class Vote < ApplicationRecord
  belongs_to :video

  counter_culture :video,
    column_names: {
      ['votes.value = ?', 1] => 'likes_count',
      ['votes.value = ?', -1] => 'dislikes_count'
    }
end

# app/models/video.rb
class Video < ApplicationRecord
  # must have :likes_count and :dislikes_count as integer columns
end
```

And in the migration:

```ruby
class AddLikeDislikeCountsToVideos < ActiveRecord::Migration[6.1]
  def change
    add_column :videos, :likes_count, :integer, default: 0, null: false
    add_column :videos, :dislikes_count, :integer, default: 0, null: false
    Video.reset_column_information
    Video.find_each do |video|
      counts = video.votes.group(:value).count
      video.update_columns(
        likes_count: counts[1] || 0,
        dislikes_count: counts[-1] || 0
      )
    end
  end
end
```
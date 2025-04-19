## 🐿️ Polymorphic Counter Cache Optimization
Using `counter_cache` on polymorphic associations lets Rails maintain counts automatically without extra queries. You can specify a custom counter column name to avoid naming collisions and follow project conventions. Remember to backfill the new counter by resetting counters after migration.

```ruby
# app/models/comment.rb
class Comment < ApplicationRecord
  belongs_to :commentable, polymorphic: true, counter_cache: :comments_count
end

# app/models/post.rb
class Post < ApplicationRecord
  has_many :comments, as: :commentable
end

# Migration to add counter cache
class AddCommentsCountToCommentables < ActiveRecord::Migration[6.1]
  def change
    add_column :posts, :comments_count, :integer, default: 0, null: false
    # Repeat for other polymorphic models if needed
  end
end

# Backfill existing counts
Post.find_each { |p| Post.reset_counters(p.id, :comments) }
```
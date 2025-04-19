## 🗃️ Scoped Counters with Conditions
CounterCulture allows you to maintain counters using scopes, so you can count only the records matching a condition (e.g., only approved comments). This helps keep your data accurate and avoids adding complex SQL or manual callbacks. Simply pass a lambda to the `scope` option and CounterCulture will apply it to each update.

```ruby
# app/models/comment.rb
class Comment < ApplicationRecord
  belongs_to :post

  counter_culture :post,
    column_name: Proc.new { |model| model.approved? ? 'approved_comments_count' : nil },
    column_names: {
      ['comments.approved = ?', true] => 'approved_comments_count'
    }
end

# app/models/post.rb
class Post < ApplicationRecord
  # ensure you have an integer column :approved_comments_count with default 0
end
```

In the migration you’d add:

```ruby
class AddApprovedCommentsCountToPosts < ActiveRecord::Migration[6.1]
  def change
    add_column :posts, :approved_comments_count, :integer, default: 0, null: false
    Post.find_each { |p| p.update_column(:approved_comments_count, p.comments.where(approved: true).count) }
  end
end
```
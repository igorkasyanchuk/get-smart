## 📦 Installing and Configuring Counter Culture

Counter Culture helps you keep counter caches in sync without manual SQL. First, add it to your Gemfile and run bundler to install:

```ruby
gem 'counter_culture'
```

Next, generate a migration to add a counter column to the parent model (e.g., `comments_count` on `posts`):

```bash
rails generate migration AddCommentsCountToPosts comments_count:integer
```

Then open the generated migration and set a default value and null constraint:

```ruby
class AddCommentsCountToPosts < ActiveRecord::Migration[6.0]
  def change
    add_column :posts, :comments_count, :integer, default: 0, null: false
  end
end
```

Run the migration:

```bash
rails db:migrate
```

Finally, configure your `Comment` model to update the counter cache on `Post`:

```ruby
class Comment < ApplicationRecord
  belongs_to :post
  counter_culture :post
end
```

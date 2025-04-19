## 🔧 Add Models and Migrations to Your Engine

You can define models and migrations inside your engine just like in a Rails app. Place your model under `app/models` and create migrations in `db/migrate`. Then, use the built‑in rake task to copy migrations into the host app.

```ruby
# blog_engine/app/models/blog_engine/post.rb
module BlogEngine
  class Post < ApplicationRecord
    validates :title, presence: true
  end
end
```

```ruby
# blog_engine/db/migrate/20230101000000_create_blog_engine_posts.rb
class CreateBlogEnginePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :blog_engine_posts do |t|
      t.string :title
      t.text :content
      t.timestamps
    end
  end
end
```

Then in your host app run:

```bash
$ bin/rails blog_engine:install:migrations
$ bin/rails db:migrate
```
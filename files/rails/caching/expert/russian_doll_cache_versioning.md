## 🧠 Master Russian Doll Caching with Touch-Based Versioning

Layered (Russian doll) fragment caching minimizes view rendering by nesting caches. Use `touch: true` on associations to automatically bump parent cache keys when children change.

```ruby
# app/models/post.rb
class Post < ApplicationRecord
  has_many :comments, dependent: :destroy, touch: true
end

# app/views/posts/_post.html.erb
<% cache post do %>
  <h2><%= post.title %></h2>
  <%= render post.comments %>  <!-- nested cache -->
<% end %>
```

When a comment is created or updated, `post.updated_at` changes, invalidating the parent cache without manual key manipulation.
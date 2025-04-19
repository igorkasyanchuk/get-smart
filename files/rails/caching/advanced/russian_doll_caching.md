## 🏗️ Russian Doll Caching with `touch`

Leverage ActiveRecord's `touch` callbacks to automatically expire parent fragments when nested records change. This pattern ensures that you only rebuild the minimal necessary portion of a view when deep associations are updated, achieving near-zero cache bloat. Implement the `touch` option on associations and use nested `cache` calls in your templates.

```ruby
# app/models/post.rb
class Post < ApplicationRecord
  has_many :comments, dependent: :destroy, touch: true
end

# app/models/comment.rb
class Comment < ApplicationRecord
  belongs_to :post
end
```

```erb
<!-- app/views/posts/_post.html.erb -->
<%= cache @post do %>
  <h2><%= @post.title %></h2>
  <%= render @post.comments %>
<% end %>

<!-- app/views/comments/_comment.html.erb -->
<%= cache comment do %>
  <div><%= comment.body %></div>
<% end %>
```

Now, updating a comment will `touch` its parent `post`, invalidating only the outer fragment.
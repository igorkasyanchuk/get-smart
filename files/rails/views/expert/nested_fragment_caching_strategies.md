## 🚀 Advanced Nested Fragment Caching with Russian Doll
Achieve near-instant page renders by combining Russian doll caching, conditional cache keys, and touch-based expiration for models with complex associations.

```erb
<% cache [@post, @post.comments.maximum(:updated_at)] do %>
  <%= render @post.comments %>
<% end %>

<% cache [comment, comment.replies.maximum(:updated_at)] do %>
  <%= render comment.replies %>
<% end %>
```

Ensure to `touch: true` on associations:

```ruby
has_many :comments, dependent: :destroy, touch: true
```
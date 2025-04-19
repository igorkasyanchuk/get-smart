## 🚀 Integrating ViewComponent with Turbo Streams for Live UI Updates
Combine ViewComponent rendering with Turbo Stream templates to target and replace parts of the page dynamically. This pattern is ideal for real-time updates without full-page reloads.

```erb
<!-- app/views/posts/create.turbo_stream.erb -->
<%= turbo_stream.prepend "posts",
      partial: "posts/post_component",
      locals: { post: @post } %>
```

```ruby
# app/components/posts/post_component.rb
class Posts::PostComponent < ViewComponent::Base
  def initialize(post:)
    @post = post
  end
end
```

```erb
<!-- app/components/posts/_post_component.html.erb -->
<div id="post_<%= @post.id %>" class="post">
  <h2><%= @post.title %></h2>
  <p><%= @post.body %></p>
</div>
```
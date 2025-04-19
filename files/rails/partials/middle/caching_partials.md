## ⚡ Caching Partials for Performance

Fragment caching in partials can drastically speed up view rendering by storing pre-rendered HTML. Wrap your `render` call or markup inside a `cache` block keyed by a record or custom key. Rails will skip re-rendering the block if the key is still fresh, reducing database hits and template parsing.

```erb
<% cache(@post) do %>
  <%= render partial: 'post_summary', locals: { post: @post } %>
<% end %>

<!-- Cached fragment will expire automatically when @post is updated -->
```
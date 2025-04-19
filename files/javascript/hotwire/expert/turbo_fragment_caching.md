## 🧩 Leverage Turbo Fragment Caching with Custom Keys

Wrap expensive Turbo Stream partials in `fragment_cache` and provide custom cache keys based on multiple model timestamps. This reduces server render time for repeated updates.

```erb
<% cache([comment, user, cache_key_with_version(comment)]) do %>
  <turbo-stream action="replace" target="comment_#{comment.id}">
    <template><%= render partial: "comments/comment", locals: { comment: comment } %></template>
  </turbo-stream>
<% end %>
```
## 🎁 Wrapping Partials with a Layout
You can DRY up your markup by using the `layout` option when rendering a partial, effectively wrapping each instance in a shared container. This is especially handy for lists where you want consistent HTML around each element without repeating it in the partial itself.

```erb
<%# app/views/comments/index.html.erb %>
<%= render partial: 'comments/comment', collection: @comments, layout: 'comments/comment_wrapper' %>
```

```erb
<%# app/views/comments/_comment_wrapper.html.erb %>
<div class="comment-box">
  <%= yield %>
</div>
```
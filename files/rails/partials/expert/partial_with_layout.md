## 🏗️ Rendering Partials with Custom Layouts

Treat partials like isolated components by wrapping them in lightweight layouts. Use `render partial:` with a `layout:` option to apply consistent wrappers—for instance, cards or panels—while keeping the markup DRY and maintainable.

```erb
<%= render partial: 'comments/comment',
           layout: 'shared/panel',
           locals: { title: "Comment ##{comment.id}", comment: comment } %>
```

```erb
<%# in app/views/shared/_panel.html.erb %>
<div class="panel">
  <div class="panel-header"><%= title %></div>
  <div class="panel-body"><%= yield %></div>
</div>
```
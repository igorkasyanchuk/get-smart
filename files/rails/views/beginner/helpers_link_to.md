## 🔗 Create Links with `link_to`

The `link_to` helper generates anchor tags with URL and HTML options. It automatically escapes content and handles URL generation via named routes.

```erb
<%= link_to 'Home', root_path, class: 'btn btn-primary' %>
<%= link_to 'Edit', edit_article_path(@article), data: { confirm: 'Are you sure?' } %>
```
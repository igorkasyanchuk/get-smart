## 📝 Passing Local Variables
Partials can accept local variables so you can customize their output. Pass a hash to the `locals:` option to make data available inside the partial.

```erb
<!-- app/views/posts/show.html.erb -->
<%= render "comments/comment", locals: { comment: @post.comments.first, highlight: true } %>
```

Inside `app/views/comments/_comment.html.erb`, you can use `<%= comment.body %>` and conditionally style it with `<% if highlight %>…<% end %>`.
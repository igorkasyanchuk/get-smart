## 📄 Break Views into Partials

Partials help you extract reusable bits of markup into separate files, making your views cleaner. Name the file with a leading underscore and render it where needed.

```erb
<!-- app/views/posts/_post.html.erb -->
<article>
  <h2><%= post.title %></h2>
  <p><%= post.body.truncate(100) %></p>
</article>

<!-- app/views/posts/index.html.erb -->
<%= render 'post', post: @posts.first %>
```
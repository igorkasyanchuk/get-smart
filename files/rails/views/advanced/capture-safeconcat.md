## 🎣 Tip: Build Complex HTML with `capture` and `safe_concat`
Use `capture` to build content fragments in helpers or views, then `safe_concat` to append HTML directly without escaping. This is helpful for building dynamic lists or trees.

Example:

```erb
<% tree = capture do %>
  <ul>
  <% @categories.each do |cat| %>
    <li><%= cat.name %></li>
  <% end %>
  </ul>
<% end %>
<%= safe_concat(tree) %>
```
## 🖼️ Displaying Images in Views

Use the `url_for` helper and `image_tag` to render uploaded images. This automatically handles signed URLs and serves files through configured service.

```erb
<!-- app/views/users/show.html.erb -->
<% if @user.avatar.attached? %>
  <%= image_tag url_for(@user.avatar), alt: "#{@user.name} Avatar" %>
<% else %>
  <p>No avatar uploaded.</p>
<% end %>
```
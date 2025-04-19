## 🔧 Turbo Frames for Partial Page Updates
Turbo Frames allow you to update only a portion of the page after an action without writing custom JS. Wrap the region in `turbo_frame_tag` and target it via `data-turbo-frame`.

```erb
<%= turbo_frame_tag "comments" do %>
  <%= render @post.comments %>
  <%= form_with(model: [ @post, Comment.new ], data: { turbo_frame: "comments" }) %>
<% end %>
```
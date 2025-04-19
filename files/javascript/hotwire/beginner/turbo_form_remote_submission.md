## 📝 Use Turbo for AJAX Form Submissions

Turbo automatically intercepts form submissions. Simply wrap your form in a Turbo Frame or use `data-turbo="true"` for AJAX behavior.

```erb
<turbo-frame id="comment_form">
  <%= form_with(model: [post, Comment.new]) do |f| %>
    <%= f.text_area :body %>
    <%= f.submit "Add Comment" %>
  <% end %>
</turbo-frame>
```  
The form will submit via AJAX and update the frame with the server response.
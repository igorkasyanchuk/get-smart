## ➕ Append Elements with Turbo Stream

Use `turbo_stream.append` in your `.turbo_stream.erb` to add new elements at the end of a list or container.

```erb
<%= turbo_stream.append "messages" do %>
  <div id="message_<%= message.id %>"><%= message.body %></div>
<% end %>
```  
The client will insert the new `<div>` inside `<turbo-frame id="messages">` or the element with ID `messages`.
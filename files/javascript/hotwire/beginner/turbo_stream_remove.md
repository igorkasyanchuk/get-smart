## ❌ Remove Elements with Turbo Stream

You can remove DOM elements by targeting their IDs in a `.turbo_stream.erb` template.

```erb
<%= turbo_stream.remove dom_id(@task) %>
```  
When the server renders this, Turbo will find and remove the HTML element matching that ID.
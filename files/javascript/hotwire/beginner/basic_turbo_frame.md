## 🔗 Wrap Content in a Turbo Frame

Turbo Frames let you update only a section of the page. Wrap the content you want to target in a `<turbo-frame>` tag.

```erb
<turbo-frame id="notifications">
  <%= render @notifications %>
</turbo-frame>
```  
Now you can update the `notifications` frame independently from the rest of the page.
## 🚀 Navigate Within a Turbo Frame

To load a link’s response into a specific frame, use `data-turbo-frame` with the frame’s ID.

```erb
<%= link_to "Load more posts", posts_path(page: 2), data: { turbo_frame: "posts" } %>
```  
The response will replace the contents of `<turbo-frame id="posts">`.
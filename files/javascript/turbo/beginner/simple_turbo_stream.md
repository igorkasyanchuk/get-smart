## ⚡️ Simple Turbo Stream Response
Turbo Streams allow server-push updates. Return a Turbo Stream template from your server to prepend, append, or replace content in the DOM.

```erb
<turbo-stream action="append" target="comments_list">
  <template>
    <div class="comment">
      <%= @comment.text %>
    </div>
  </template>
</turbo-stream>
```
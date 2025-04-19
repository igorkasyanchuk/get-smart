## 🏷️ Namespaced Turbo Stream Channels for Scalable Apps

Prefix Turbo Stream broadcasts with dynamic targets and channels to avoid collisions in multi‑tenant or componentized views. Use string interpolation on both client and server sides.

```erb
<turbo-stream action="replace" target="comment_#{comment.id}_user_#{user.id}">
  <template>
    <%= render partial: "comments/comment", locals: { comment: comment } %>
  </template>
</turbo-stream>
```

```js
consumer.subscriptions.create({ channel: "CommentsChannel", room: "post_#{postId}" }, {
  received(data) {
    window.Turbo.renderStreamMessage(data);
  }
});
```
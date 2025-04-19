## 🚀 Batch Update Multiple DOM Targets with Turbo Streams

Leverage the `window.Turbo.renderStreamMessage` API to send multiple Turbo Stream actions in one payload, reducing round‑trips and improving perceived performance. You can compose multiple `<turbo-stream>` tags as a single string and render them atomically on the client.

```js
const stream = `
  <turbo-stream action="replace" target="user_list">
    <template>
      ${userListHTML}
    </template>
  </turbo-stream>
  <turbo-stream action="append" target="notifications">
    <template>
      <p>New real-time alert!</p>
    </template>
  </turbo-stream>
`;

window.Turbo.renderStreamMessage(stream);
```
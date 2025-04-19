## 🧰 Turbo Stream Client-Side Lifecycle Hooks
Extend Turbo Streams by hooking into client-side events like `turbo:before-stream-render`. You can intercept and mutate incoming fragments before they are applied.

```js
document.addEventListener("turbo:before-stream-render", event => {
  const stream = event.target;
  if (stream.getAttribute("action") === "append") {
    // sanitize or modify content
    stream.template.content.querySelectorAll("script").forEach(el => el.remove());
  }
});
```
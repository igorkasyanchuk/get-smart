## 🚑 Handling Turbo Fetch Errors
Capture errors with the `turbo:before-fetch-response` event. Check status and display a message when requests fail.

```js
window.addEventListener("turbo:before-fetch-response", (event) => {
  if (!event.detail.fetchResponse.ok) {
    alert("An error occurred while loading content.");
    event.preventDefault();
  }
});
```
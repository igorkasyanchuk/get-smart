## 🛠 Listening to turbo:before-fetch-request
Hook into Turbo’s lifecycle to modify requests. Use the `turbo:before-fetch-request` event to add headers or tokens before each request.

```js
window.addEventListener("turbo:before-fetch-request", (event) => {
  event.detail.fetchOptions.headers["X-CSRF-Token"] = document.querySelector('meta[name="csrf-token"]').content;
});
```
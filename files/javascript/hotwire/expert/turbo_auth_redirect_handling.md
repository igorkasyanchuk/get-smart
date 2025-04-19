## 🔐 Handle Authentication Redirects Gracefully in Turbo Drives

Intercept 401/403 responses globally to redirect Turbo navigations to the login page, then replay the original intent on successful auth. This avoids broken pages and preserves user flow.

```js
addEventListener("turbo:fetch-response", async (event) => {
  const response = event.detail.fetchResponse.response;
  if (response.status === 401) {
    event.preventDefault();
    await window.Turbo.visit("/login?redirect_to=" + encodeURIComponent(window.location.pathname));
  }
});
```
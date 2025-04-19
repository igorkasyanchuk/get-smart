## 🔍 Intercepting and Modifying Turbo Requests
Tap into Turbo’s fetch pipeline to customize headers, handle auth, or log requests. Listen to `turbo:before-fetch-request`, amend the FetchOptions, and then let Turbo proceed with the modified request.

```javascript
document.addEventListener('turbo:before-fetch-request', event => {
  const { fetchOptions } = event.detail
  // Inject a custom header for API tracking
  fetchOptions.headers['X-Client-Token'] = window.clientToken
})
```

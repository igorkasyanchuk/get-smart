## 🚨 Error Handling in Turbo Stream Responses
Catch server errors in Turbo Streams and display fallback UI. Add a global listener for `turbo:before-fetch-response`.

```javascript
document.addEventListener('turbo:before-fetch-response', (event) => {
  const { fetchResponse } = event.detail
  if (!fetchResponse.ok) {
    event.preventDefault()
    showErrorBanner(`Error ${fetchResponse.status}: ${fetchResponse.statusText}`)
  }
})
```

Preventing default stops Turbo from processing the stream, giving you control UI-side.
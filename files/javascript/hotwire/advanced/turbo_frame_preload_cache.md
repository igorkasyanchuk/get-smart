## 📦 Preloading Turbo Frame Content with Cache
Cache Turbo Frame responses in memory to avoid refetching when users toggle between frames. Manage a simple JS map keyed by URL.

```javascript
const frameCache = new Map()

document.addEventListener("turbo:before-fetch-response", (event) => {
  const { fetchResponse, fetchRequest } = event.detail
  if (fetchRequest.url.includes('/dashboard/section')) {
    frameCache.set(fetchRequest.url, fetchResponse.clone())
  }
})

document.addEventListener("turbo:before-fetch-request", (event) => {
  const url = event.detail.fetchOptions.url
  if (frameCache.has(url)) {
    event.preventDefault()
    Turbo.renderStreamMessage(frameCache.get(url).text)
  }
})
```

This avoids duplicate HTTP calls for cached frames.
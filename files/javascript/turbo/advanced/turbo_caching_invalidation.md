## 🗂️ Turbo Caching Strategies and Invalidation
Turbo caches visited pages to speed up back/forward transitions. Use `Turbo.clearCache()` for manual invalidation when underlying data changes, ensuring stale content is never shown.

```javascript
// Clear cache after a destructive action
document.addEventListener('turbo:submit-end', event => {
  if (event.detail.success && event.target.action.endsWith('/destroy')) {
    Turbo.clearCache()
  }
})
```

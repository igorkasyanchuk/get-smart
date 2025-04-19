## 📈 Performance Tuning: Debouncing Turbo Visits
Prevent rapid successive Turbo navigations from overwhelming your server by debouncing `Turbo.visit` calls. This is crucial on high-frequency link clicks or programmatic navigation loops.

```javascript
// app/javascript/debounce_turbo.js
let debounceTimeout
function visitDebounced(url) {
  clearTimeout(debounceTimeout)
  debounceTimeout = setTimeout(() => Turbo.visit(url), 200)
}

// Usage
document.querySelectorAll('.nav-link').forEach(link => {
  link.addEventListener('click', event => {
    event.preventDefault()
    visitDebounced(link.href)
  })
})
```

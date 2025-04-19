## ⚡️ Preloading Turbo Frames on Hover
Preload linked Turbo Frames on link hover to warm up the browser cache and dramatically cut navigation latency. By issuing a fetch request with the `Turbo-Frame` header set, you prime the frame’s content before the user clicks.

```javascript
// app/javascript/preload_turbo_frame.js
document.querySelectorAll('a[data-turbo-frame]').forEach(link => {
  let preloaded = false
  link.addEventListener('mouseover', () => {
    if (preloaded) return
    preloaded = true
    fetch(link.href, { headers: { 'Turbo-Frame': link.dataset.turboFrame } })
  })
})
```

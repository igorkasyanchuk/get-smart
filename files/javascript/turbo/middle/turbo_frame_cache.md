## 💾 Preserve Frame Content Between Visits

Cache Turbo Frames' innerHTML in-memory to avoid unnecessary refetches on quick navigations. Use the `turbo:before-cache` event to store frame content and restore it on `turbo:load`, skipping reloads when possible.

```javascript
const frameCache = {};

document.addEventListener('turbo:before-cache', () => {
  document.querySelectorAll('turbo-frame').forEach(frame => {
    frameCache[frame.id] = frame.innerHTML;
  });
});

document.addEventListener('turbo:load', () => {
  for (const [id, html] of Object.entries(frameCache)) {
    const frame = document.getElementById(id);
    if (frame && !frame.hasAttribute('data-reload')) {
      frame.innerHTML = html;
    }
  }
});
```

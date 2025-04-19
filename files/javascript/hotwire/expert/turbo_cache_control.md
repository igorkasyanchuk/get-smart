## 🗄️ Fine‑Tune Turbo Drive Caching Strategies

Override the default cache behavior by listening to Turbo events and manually controlling snapshot storage. You can drop or replace snapshots for specific frames to avoid stale content.

```js
document.addEventListener("turbo:before-cache", () => {
  // Remove dynamic elements before caching
  document.querySelectorAll('.live-chart').forEach(el => el.remove());
});

document.addEventListener("turbo:visit", () => {
  // Expire snapshot on certain visits
  turbo.session.clearCache();
});
```
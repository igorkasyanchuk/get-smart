## 🔧 Use Low‑Level Turbo API for Maximal Control

Tap into `window.Turbo.controllerAdapters` and `Turbo.session` internals to create custom drive behaviors, like selective snapshotting or on‑the‑fly link rewriting.

```js
// Override link click behavior globally
Turbo.session.drive = true;

Turbo.session.adapter.visitProposedToLocation = (anchor, location) => {
  if (location.includes("/admin")) {
    window.location = location; // bypass turbo for admin
  } else {
    Turbo.session.adapter.visitProposedToLocation(anchor, location);
  }
};
```
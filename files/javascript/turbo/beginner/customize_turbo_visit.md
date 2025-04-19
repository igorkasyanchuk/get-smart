## 🔧 Customize Visit Behavior
You can programmatically visit URLs using `Turbo.visit`. This is useful for navigation from JavaScript without a link click.

```js
// Navigate to a new URL via Turbo
Turbo.visit("/dashboard", { action: "replace" });
```
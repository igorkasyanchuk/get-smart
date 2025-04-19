## 💤 Lazy-Loading Controllers via Webpack
Optimize initial load by deferring less critical controllers. Create an asynchronous registry that only imports modules when a matching data attribute appears in the viewport.

```javascript
// registry.js
const registry = {}

export function registerLazy(identifier, loader) {
  registry[identifier] = loader
}

export async function loadController(identifier) {
  if (registry[identifier]) {
    const module = await registry[identifier]()
    application.register(identifier, module.default)
  }
}

// lazy import
import { registerLazy, loadController } from "./registry"
registerLazy("chart", () => import("./controllers/chart_controller"))

// observe
document.addEventListener("DOMContentLoaded", () => {
  document.querySelectorAll("[data-controller='chart']").forEach(el => {
    loadController("chart")
  })
})
```

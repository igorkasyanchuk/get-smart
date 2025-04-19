## 🚀 Dynamically Import Stimulus Controllers

When you have dozens of controllers, bundling all at startup impacts performance. Dynamically importing controllers only when needed allows faster initial loads and on‑demand code. Use the `data-controller` attribute to import modules via ES dynamic import.

```javascript
// application.js
import { Application } from "@hotwired/stimulus"
const application = Application.start()

document.addEventListener("DOMContentLoaded", async () => {
  document.querySelectorAll("[data-controller]").forEach(async element => {
    const controllerName = element.getAttribute("data-controller")
    const module = await import(`./controllers/${controllerName}_controller.js`)
    application.register(controllerName, module.default)
  })
})
```
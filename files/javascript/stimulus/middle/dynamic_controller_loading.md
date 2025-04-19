## 📦 Loading Controllers Dynamically

Dynamically import Stimulus controllers to reduce initial bundle size. Use dynamic `import()` in response to user actions or visibility triggers.

```js
import { Application } from "@hotwired/stimulus"
const application = Application.start()

// On-demand controller registration
async function loadEditor() {
  const module = await import("./controllers/editor_controller")
  application.register("editor", module.default)
}

document.getElementById("edit-btn").addEventListener("click", loadEditor)
```

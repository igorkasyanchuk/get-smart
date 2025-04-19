## 🧩 Dynamic Controller Composition
Stimulus allows you to dynamically register controllers at runtime, enabling modular loading and composition of features. Use `application.register` to add controllers when certain conditions are met (e.g., lazy-loading based on viewport). This approach reduces initial bundle size and improves performance.

```javascript
import { Application } from "@hotwired/stimulus"
const application = Application.start()

async function loadUserProfileController() {
  const module = await import("./controllers/user_profile_controller")
  application.register("user-profile", module.default)
}

if (document.querySelector("[data-controller='user-profile']")) {
  loadUserProfileController()
}
```

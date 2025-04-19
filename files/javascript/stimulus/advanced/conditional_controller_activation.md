## 🔍 Conditional Controller Activation
Activate controllers based on runtime conditions by extending the `Application` class. Override `load` to filter controllers you don’t want loaded on certain pages (e.g., admin vs user-facing).

```javascript
import { Application } from "@hotwired/stimulus"

class ConditionalApplication extends Application {
  load(registry) {
    Object.entries(registry).forEach(([identifier, controller]) => {
      if (identifier !== "admin" && window.location.pathname.startsWith("/admin")) {
        return
      }
      this.register(identifier, controller)
    })
  }
}

const application = new ConditionalApplication()
application.load(require.context("./controllers", true, /_controller\.js$/))
```

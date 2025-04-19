## 🛡️ Implement Middleware for Actions

Intercept actions globally (e.g., for authorization, logging). Wrap the `Action` constructor to run middleware before invoking the target method.

```javascript
// middleware.js
export function withMiddleware(controllerClass, ...middleware) {
  const originalActions = controllerClass.actions
  controllerClass.actions = new Proxy(originalActions, {
    get(target, prop) {
      const action = target[prop]
      return function(event) {
        middleware.forEach(fn => fn(event))
        return action.call(this, event)
      }
    }
  })
  return controllerClass
}

// logging_middleware.js
export function logEvent(event) {
  console.log("Action fired:", event.type, event)
}

// application_controller.js
import { Controller } from "@hotwired/stimulus"
import { withMiddleware } from "./middleware"
import { logEvent } from "./logging_middleware"

class AppController extends Controller {
  static actions = {
    click: "handleClick"
  }

  handleClick(event) {
    // business logic
  }
}

export default withMiddleware(AppController, logEvent)
```
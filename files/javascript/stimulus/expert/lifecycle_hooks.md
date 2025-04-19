## 🔄 Hooking into Custom Lifecycle Events

Stimulus lifecycle events (`connect`, `disconnect`, `initialize`) are limited. Extend controllers with custom hooks via decorators or base classes to trigger ordered phases (e.g., `beforeConnect`, `afterConnect`).

```javascript
// base_controller.js
export class BaseController extends Controller {
  connect() {
    this.beforeConnect?.()
    super.connect()
    this.afterConnect?.()
  }
}

// stopwatch_controller.js
import { BaseController } from "./base_controller"

export default class extends BaseController {
  beforeConnect() {
    console.log("Setting up timer...")
  }

  afterConnect() {
    this.startTime = performance.now()
  }
}
```
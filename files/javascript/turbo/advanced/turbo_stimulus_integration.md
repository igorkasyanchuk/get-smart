## 🧩 Integrating Turbo with Stimulus Controllers
Leverage Stimulus to hook into Turbo Frame lifecycle events for custom behavior like animations or logging. Use `turbo:load` and `turbo:frame-load` to trigger your controller logic when frames finish loading.

```javascript
// app/javascript/controllers/analytics_controller.js
import { Controller } from '@hotwired/stimulus'

export default class extends Controller {
  connect() {
    this.logLoad = this.logLoad.bind(this)
    document.addEventListener('turbo:frame-load', this.logLoad)
  }

  disconnect() {
    document.removeEventListener('turbo:frame-load', this.logLoad)
  }

  logLoad(event) {
    console.log('Frame loaded:', event.target.id)
    // integrate with analytics service...
  }
}
```

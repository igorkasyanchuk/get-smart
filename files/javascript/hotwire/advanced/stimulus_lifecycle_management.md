## ⏱️ Managing Stimulus Controller Lifecycle on Turbo Visits
Stimulus controllers can linger between Turbo visits if not properly disconnected. Use lifecycle callbacks to reset state.

```javascript
import { Controller } from 'stimulus'
export default class extends Controller {
  connect() { console.log('connected:', this.element) }
  disconnect() { console.log('disconnected:', this.element) }
  turboBeforeCache() { this.disconnect() }
}
```

Implement `turbo:before-cache` (`turboBeforeCache`) to tear down any state before caching.
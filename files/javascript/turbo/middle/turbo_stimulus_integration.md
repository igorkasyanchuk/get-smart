## 🎯 Combine Stimulus with Turbo Events

Stimulus controllers can react to Turbo lifecycle events for richer interactions. Add event listeners in your controller's `connect` method to initialize or teardown logic on page visits.

```javascript
import { Controller } from 'stimulus';

export default class extends Controller {
  connect() {
    this.loadHandler = () => this.initializeWidgets();
    document.addEventListener('turbo:load', this.loadHandler);
  }

  disconnect() {
    document.removeEventListener('turbo:load', this.loadHandler);
  }

  initializeWidgets() {
    // custom JS logic here
  }
}
```

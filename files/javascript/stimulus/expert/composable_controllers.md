## 🔗 Create Composable Stimulus Controllers

Break logic into mixins to compose controllers. Use class decorators to merge functionality and override lifecycle methods cleanly.

```javascript
// mixins/loggable.js
export const Loggable = Base => class extends Base {
  log(message) { console.log(`[${this.identifier}] ${message}`) }
}

// mixins/toggleable.js
export const Toggleable = Base => class extends Base {
  toggle() { this.element.classList.toggle('active') }
}

// my_controller.js
import { Controller } from '@hotwired/stimulus'
import { Loggable } from './mixins/loggable'
import { Toggleable } from './mixins/toggleable'

class BaseController extends Controller {}
const Composed = Toggleable(Loggable(BaseController))

export default class extends Composed {
  connect() {
    super.connect()
    this.log('Connected')
  }
}
```
## 🎨 Define Custom Target Decorators

Extend Stimulus with custom decorators to annotate targets and values. Use a Babel plugin or TypeScript decorators to automatically generate `static targets` arrays and getters.

```javascript
// decorators.js
export function Target(name) {
  return function(target, key) {
    if (!target.constructor.targets) target.constructor.targets = []
    target.constructor.targets.push(name)
    Object.defineProperty(target, `${key}Target`, {
      get() { return this.targets.get(name) }
    })
  }
}

// user_controller.js
import { Controller } from '@hotwired/stimulus'
import { Target } from './decorators'

export default class extends Controller {
  @Target('name') name
  @Target('email') email

  connect() {
    console.log(this.nameTarget.value, this.emailTarget.value)
  }
}
```
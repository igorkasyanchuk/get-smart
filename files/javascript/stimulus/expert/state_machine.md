## 🎛️ Embed a State Machine in a Controller

Implement a finite state machine directly inside a Stimulus controller for complex UI workflows. Use a library like XState or a minimal custom machine to manage transitions in `@action` handlers.

```javascript
import { Controller } from "@hotwired/stimulus"
import { createMachine, interpret } from "xstate"

export default class extends Controller {
  initialize() {
    const toggleMachine = createMachine({
      id: 'toggle',
      initial: 'off',
      states: {
        off: { on: { TOGGLE: 'on' } },
        on: { on: { TOGGLE: 'off' } }
      }
    })
    this.service = interpret(toggleMachine)
      .onTransition(state => this.updateUI(state.value))
      .start()
  }

  updateUI(state) {
    this.element.dataset.state = state
  }

  onToggle() {
    this.service.send('TOGGLE')
  }
}
```
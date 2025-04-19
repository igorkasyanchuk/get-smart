## 📦 Custom Event Delegation with Actions
Extend Stimulus’s action syntax by writing custom action functions. This tip shows how to handle delegated events for dynamic lists or grids without manually attaching listeners on each element.

```javascript
// custom_actions.js
export function delegateEvent(event) {
  const actionTarget = event.target.closest(`[data-action*="${event.type}"]`)
  if (actionTarget) {
    const [ , controller, method ] = actionTarget.dataset.action.split("#")
    const ctrl = event.currentTarget.application.getControllerForElementAndIdentifier(
      actionTarget, controller
    )
    ctrl[method](event)
  }
}

// application.js
import { Application } from "@hotwired/stimulus"
import { delegateEvent } from "./custom_actions"

const application = Application.start()
application.element.addEventListener("click", delegateEvent)
```

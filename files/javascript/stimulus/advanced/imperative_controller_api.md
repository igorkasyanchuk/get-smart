## ⚙️ Imperative Controller API Usage
Instead of relying solely on data-action markup, use Stimulus’s imperative API to dispatch actions or invoke methods programmatically. This is useful for complex flows or when integrating with other libraries.

```javascript
// Somewhere in your application code
import { Application } from "@hotwired/stimulus"
import NotifyController from "./controllers/notify_controller"

const application = Application.start()
application.register("notify", NotifyController)

// Later, trigger an action on the element
const element = document.querySelector("[data-controller='notify']")
const controller = application.getControllerForElementAndIdentifier(
  element,
  "notify"
)
controller.showMessage("Hello World!")
```

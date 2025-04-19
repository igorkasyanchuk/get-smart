## 🐞 Debugging with the Stimulus Inspector

Use the Stimulus Chrome/Firefox extension to inspect controllers, actions, and state. Tweak your code based on real-time feedback from the devtools panel.

```js
import { Controller } from "@hotwired/stimulus"
import { debug } from "@hotwired/stimulus"

debug(true) // Enable verbose logging in the console

export default class extends Controller {
  connect() {
    console.log("Debugging enabled for this controller")
  }
}
```

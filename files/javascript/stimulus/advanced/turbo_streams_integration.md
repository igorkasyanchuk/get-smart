## 📡 Integrating with Turbo Streams
Stimulus can listen for Turbo Stream broadcasts to update controllers reactively. Use `addEventListener('turbo:before-stream-render')` to intercept and bind data to your controller before it’s rendered.

```javascript
import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  connect() {
    document.addEventListener(
      "turbo:before-stream-render",
      this.handleStream.bind(this)
    )
  }

  handleStream(event) {
    const stream = event.target
    if (stream.getAttribute("data-update-controller") === this.identifier) {
      this.element.innerHTML = stream.innerHTML
    }
  }
}
```

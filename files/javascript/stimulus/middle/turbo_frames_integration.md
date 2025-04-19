## 🏎️ Integrating with Turbo Frames

Stimulus works seamlessly with Turbo Frames. Listen for Turbo events like `turbo:frame-load` to trigger controller logic when a frame updates.

```html
<turbo-frame id="comments" src="/comments">
  <div data-controller="comments">
    <!-- initial loader -->
  </div>
</turbo-frame>
```

```js
import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  connect() {
    this.element
      .closest("turbo-frame")
      .addEventListener("turbo:frame-load", () => this.onFrameLoad())
  }

  onFrameLoad() {
    console.log("Comments frame reloaded")
  }
}
```

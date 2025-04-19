## 🌀 Bridge Stimulus Controllers and Turbo via Custom Events

Emit custom events in a Stimulus controller to trigger Turbo Drive navigations or frame updates without coupling to Turbo internals. Listening for custom events keeps your JS modular and testable.

```js
// controllers/navigation_controller.js
import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  connect() {
    this.element.addEventListener("navigate-to", this.handleNavigate);
  }

  handleNavigate = (event) => {
    window.Turbo.visit(event.detail.url);
  }

  triggerNavigation() {
    this.element.dispatchEvent(new CustomEvent("navigate-to", {
      detail: { url: "/reports" }, bubbles: true
    }));
  }
}
```
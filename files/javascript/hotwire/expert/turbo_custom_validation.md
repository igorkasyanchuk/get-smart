## ✍️ Custom Form Validation with Turbo Streams

Combine client‑side validation in Stimulus with Turbo Streams for server errors. Capture invalid fields and stream back per‑field errors without a full page reload.

```js
// controllers/form_controller.js
import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["input", "errors"];

  async submit(event) {
    event.preventDefault();
    const formData = new FormData(this.element);
    const response = await fetch(this.element.action, { method: "POST", body: formData });

    if (response.ok) {
      Turbo.visit(response.url);
    } else {
      const streams = await response.text();
      window.Turbo.renderStreamMessage(streams);
    }
  }
}
```
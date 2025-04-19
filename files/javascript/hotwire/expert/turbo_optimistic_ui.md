## ⚡️ Implement Optimistic UI Updates in Turbo Frames

Intercept form submissions in a custom Stimulus controller to speculatively render a loading state before the server response arrives. If the request succeeds, replace the frame content; on failure, revert back to the original HTML.

```js
import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["form", "frame"];

  async submit(event) {
    event.preventDefault();
    const originalHTML = this.frameTarget.innerHTML;
    this.frameTarget.innerHTML = '<div class="loading">Saving...</div>';

    const response = await fetch(this.formTarget.action, {
      method: this.formTarget.method,
      body: new FormData(this.formTarget)
    });

    if (response.ok) {
      const html = await response.text();
      this.frameTarget.outerHTML = html;
    } else {
      this.frameTarget.innerHTML = originalHTML;
    }
  }
}
```
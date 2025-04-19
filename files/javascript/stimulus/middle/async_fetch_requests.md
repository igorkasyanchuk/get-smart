## 📨 Handling Async Requests with Fetch

Use `fetch` within Stimulus controllers for AJAX interactions. Combine values or data-attributes for dynamic endpoints and update the DOM on response.

```js
import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static values = { url: String }

  async submit(event) {
    event.preventDefault()
    const response = await fetch(this.urlValue, {
      method: "POST",
      headers: { "Content-Type": "application/json" },
      body: JSON.stringify({ data: this.element.dataset.payload })
    })
    const json = await response.json()
    this.element.innerHTML = json.message
  }
}
```

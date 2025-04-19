## 📝 Custom Form Submission via Turbo Frames
Override Turbo’s default form submission to add complex payloads or transform data on-the-fly. Use `turbo:before-fetch-request` on the form’s frame to intercept and modify `FormData` before it’s sent.

```javascript
// app/javascript/controllers/form_transform_controller.js
import { Controller } from '@hotwired/stimulus'

export default class extends Controller {
  connect() {
    this.element.addEventListener('turbo:before-fetch-request', event => {
      const formData = new FormData(event.target)
      // Add or transform fields
      formData.set('metadata[timestamp]', Date.now())
      // Replace body
      event.detail.fetchOptions.body = formData
    })
  }
}
```

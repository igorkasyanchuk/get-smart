## 🔧 Using Event Modifiers

Event modifiers in Stimulus can filter or alter how events are handled, like `prevent` or `stop`. Place them after the event name.

```html
<form data-controller="form"
      data-action="submit.prevent->form#submit">
  <button type="submit">Submit</button>
</form>
```

```javascript
// form_controller.js
import { Controller } from "@hotwired/stimulus"
export default class extends Controller {
  submit(event) {
    // event.preventDefault() was applied automatically
    console.log('Form submitted via AJAX')
  }
}
```
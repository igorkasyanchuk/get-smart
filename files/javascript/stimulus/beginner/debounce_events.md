## ⏱️ Debouncing Input Events

Debouncing avoids invoking a method too frequently on rapid events like `input`. Use a simple timeout in your controller.

```javascript
// search_controller.js
import { Controller } from "@hotwired/stimulus"
export default class extends Controller {
  initialize() {
    this.timeout = null
  }

  search(event) {
    clearTimeout(this.timeout)
    this.timeout = setTimeout(() => {
      console.log('Searching for', event.target.value)
    }, 300)
  }
}
```

```html
<input data-controller="search"
       data-action="input->search#search"
       placeholder="Type to search">
```
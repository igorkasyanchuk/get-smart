## 🎯 Tip: Integrate StimulusJS Controllers via `data` Attributes
Declare Stimulus controllers and actions directly in your ERB templates using `data-controller` and `data-action` attributes. This promotes uncluttered JavaScript and clear element bindings.

Example:

```erb
<div data-controller="dropdown" data-action="click->dropdown#toggle">
  <button>Menu</button>
  <ul data-dropdown-target="menu" class="hidden">
    <li>Item 1</li>
    <li>Item 2</li>
  </ul>
</div>
```
```js
// app/javascript/controllers/dropdown_controller.js
import { Controller } from "@hotwired/stimulus"
export default class extends Controller {
  static targets = ["menu"]
  toggle() {
    this.menuTarget.classList.toggle('hidden')
  }
}
```
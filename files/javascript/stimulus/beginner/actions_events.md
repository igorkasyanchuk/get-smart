## 📣 Using Actions for Events

Stimulus Actions map DOM events to controller methods declaratively. This keeps JS clean and HTML-driven.

```html
<button data-controller="hello"
        data-action="mouseenter->hello#highlight mouseleave->hello#removeHighlight">
  Hover me!
</button>
```

```javascript
// hello_controller.js
import { Controller } from "@hotwired/stimulus"
export default class extends Controller {
  highlight() {
    this.element.classList.add("highlight")
  }

  removeHighlight() {
    this.element.classList.remove("highlight")
  }
}
```